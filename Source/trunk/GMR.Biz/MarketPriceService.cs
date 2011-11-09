using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using GMR.Repository;
using GMR.Common;
using GMR.Common.Extensions;
using PagedList;

namespace GMR.Biz
{
    public class MarketPriceService : GMRService<MarketPrice>
    {
        class PriceComparer : IEqualityComparer<MarketPrice>
        {
            #region IEqualityComparer<MarketPrice> Members

            public bool Equals(MarketPrice x, MarketPrice y)
            {
                return x.PartnerID == y.PartnerID && x.SymbolNameID == y.SymbolNameID;
                //return x.EmailAddress.Equals(y.EmailAddress);
            }

            public int GetHashCode(MarketPrice obj)
            {
                return obj.GetHashCode();
            }

            #endregion
        }

        public PagedList<MarketPrice> GetLivePrices()
        {
            var query = GetQuery();
            query.OrderByDescending(p => p.UpdateDateTime).Distinct(new PriceComparer());

            var x = from p in query
                    orderby p.UpdateDateTime descending
                    group p by new { p.PartnerID, p.SymbolNameID }
                        into mygroup
                        where mygroup.Count() > 0
                        
                        select mygroup.OrderByDescending(c=>c.UpdateDateTime).FirstOrDefault();

            var result = x.OrderByDescending(p => p.PartnerID).ToPagedList(1, 100);
            return (PagedList<MarketPrice>)result;

            //return (PagedList<MarketPrice>)query.OrderBy(p=>p.PartnerID).ToPagedList(1, 100);
           ///var grouped = query.OrderByDescending(p=>p.UpdateDateTime).GroupBy(p => p.PartnerID && p.SymbolNameID);

            //foreach (var p in grouped)
            //{

            //}
            return null;
        }
        public void Update(MarketPrice model)
        {
            var item = FirstOrDefault(p => p.MarketPriceID == model.MarketPriceID);
            MarketPrice last = GetLastPriceOfDay(item.PartnerID.Value, item.SymbolNameID, DateTime.Now.AddDays(-1));
            MarketPrice first = GetFirstPriceOfDay(item.PartnerID.Value, item.SymbolNameID, DateTime.Now);

            
            //item.CopyPropertiesFrom(model, "CreatedDate", "CreatedUserID", "Dictrict);
            item.PlaceID = model.PlaceID;
            item.SymbolNameID = model.SymbolNameID;
            item.CurrBuyPrice = model.CurrBuyPrice;
            item.CurrSellPrice = model.CurrSellPrice;
            item.UpdateDateTime = DateTime.Now;
            item.UpdatedDate = DateTime.Now;

            
            model.DailyClosePrice = last != null ? last.CurrBuyPrice : model.CurrBuyPrice;
            model.DailyOpenPrice = first != null ? first.CurrBuyPrice : model.CurrBuyPrice;

            model.DailyPriceChange = model.CurrBuyPrice - model.DailyClosePrice;
            model.AdjustedRate = string.Format("{0:0.0%}", (model.DailyPriceChange / model.DailyClosePrice));

            UnitOfWork.Commit();
        }

        public void AddNewPrice(MarketPrice price)
        {
            //caculate for rate

            MarketPrice last = GetLastPriceOfDay(price.PartnerID.Value,price.SymbolNameID, DateTime.Now.AddDays(-1));
            MarketPrice first = GetFirstPriceOfDay(price.PartnerID.Value,price.SymbolNameID, DateTime.Now);
            price.DailyClosePrice = last != null ? last.CurrBuyPrice : price.CurrBuyPrice;
            price.DailyOpenPrice = first != null ? first.CurrBuyPrice : price.CurrBuyPrice;

            price.DailyPriceChange = price.CurrBuyPrice - price.DailyClosePrice;
            price.AdjustedRate = string.Format("{0:0.0%}", (price.DailyPriceChange / price.DailyClosePrice) );

            Add(price);

        }

        public MarketPrice GetLastPriceOfDay(int partnerID,int symbolId, DateTime date)
        {
            DateTime endofDate = new DateTime(date.Year, date.Month, date.Day, 23, 59, 59);
            var query = GetQuery();
            return query.Where(p => p.PartnerID == partnerID
                    && p.SymbolNameID == symbolId
                    && p.UpdatedDate < endofDate)

                .OrderByDescending(p => p.UpdatedDate)
                .FirstOrDefault();
        }
        public MarketPrice GetFirstPriceOfDay(int partnerID,int symbolId, DateTime date)
        {
            DateTime beginOfDay = new DateTime(date.Year, date.Month, date.Day, 0, 0, 0);
            var query = GetQuery();
            return query.Where(p => p.PartnerID == partnerID
                && p.SymbolNameID == symbolId
               && p.UpdateDateTime > beginOfDay)
                .OrderBy(p => p.UpdateDateTime)
                .FirstOrDefault();
        }

        public void Delete(int id, int partnerId)
        {
            var item = First(p => p.MarketPriceID == id);
            if (item != null && item.PartnerID == partnerId)
            {
                Delete(item);
            }
        }

        public static MarketPrice GetById(int id)
        {
            
            MarketPriceService service = new MarketPriceService();
            return service.FirstOrDefault(p => p.MarketPriceID == id);
        }

    }
}
