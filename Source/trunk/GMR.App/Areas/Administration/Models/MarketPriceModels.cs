using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;

namespace GMR.App.Areas.Administration.Models
{
    public class EditMarketPriceModel : CreateMarketPriceModel
    {
        [Required]
        public int Id { get; set; }
    }
    public class CreateMarketPriceModel
    {
        [Required (ErrorMessage="*")]
        [Display(Name = "Loại:")]
        public int SymbolNameId { get; set; }
        [Display(Name = "Quận/Tp")]
        public int PlaceId { get; set; }
        [Display(Name = "Loại:")]
        public string Description { get; set; }
      
        [Display(Name = "Mua:")]
        [Required(ErrorMessage="*")]
        [DataType(DataType.Currency)]
        public decimal? CurrBuyPrice { get; set; }
        
        [Display(Name = "Bán:")]
        [Required(ErrorMessage = "*")]
        [DataType(DataType.Currency)]
        public decimal? CurrSellPrice { get; set; }

        //[Required(ErrorMessage = "*")]

         [Display(Name = "Mở cửa:")]
        [DataType(DataType.Currency)]
        public decimal? DailyOpenPrice { get; set; }

         ///[Required(ErrorMessage = "*")]
         [Display(Name = "Đóng cửa:")]
        [DataType(DataType.Currency)]
        public decimal? DailyClosePrice { get; set; }

         //[Required(ErrorMessage = "*")]
         [Display(Name = "Thay đổi:")]
         [DataType(DataType.Currency)]
         public decimal? DailyPriceChange { get; set; }

         [Display(Name = "Thay đổi (%):")]
         public string AdjustedRate { get; set; }

       
    }
}