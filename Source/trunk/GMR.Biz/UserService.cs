using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using GMR.Repository;
using GMR.Common;
using GMR.Common.Extensions;

namespace GMR.Biz
{
    public class UserService : GMRService<User>
    {
        public static  User ValidateUser(string username, string password)
        {
            UserService service = new UserService();
            string hashedPassword = SecurityHelper.HashPassword(password);
            var user = service.FirstOrDefault(p => p.UserName == username && p.Password == hashedPassword);
            return user;
        }
        public bool IsAvailableEmail(int uid, string email)
        {
            var u = FirstOrDefault(p => p.Email == email);
            return u == null || u.UserID == uid;
        }
       
        //public static User Custom sample codet(User user)
        //{

        //    var context = ContextManager.GetInstance();
        //    var contextAdapter = new ObjectContextAdapter(context);

        //    var unitOfWork = new UnitOfWork(contextAdapter);

        //    var repository = new Repository<User>(contextAdapter);
        //    repository.Add(user);
        //    unitOfWork.Commit();
        //    return user;
        //}

        public static void AddUser(User i)
        {
            i.CreatedDate=  DateTime.Now;
            i.UpdatedDate = DateTime.Now;
            UserService service = new UserService();
            i.Password = SecurityHelper.HashPassword(i.Password);
            //Add business logic & checking for user.
            service.Add(i);
        }

        public User GetById(int id)
        {
            return FirstOrDefault(p => p.UserID == id);
        }

        public void Update(User user)
        {
            var u = GetById(user.UserID);
           //u.CopyPropertiesFrom(user, "Password", "CreateUserID", "Group","");
            u.FullName = user.FullName;
            u.Address = user.Address;
            u.AnualIcome = user.AnualIcome;
            u.BirthYear = user.BirthYear;
            u.Description = user.Description;
            u.Email = user.Email;
            u.GroupID = user.GroupID;
            u.Industry = user.Industry;
            u.Occupation = user.Occupation;
            u.PartnerId = user.PartnerId;
            u.PhoneNumber1 = user.PhoneNumber1;
            u.PhoneNumber2 = user.PhoneNumber2;
            u.PhoneNumber3 = user.PhoneNumber3;
            u.UpdatedDate = DateTime.Now;
            u.UpdatedUserID = user.UpdatedUserID;
            u.UserTypeID = user.UserTypeID;
            u.UpdatedDate = DateTime.Now;
            if(!string.IsNullOrEmpty(user.Password)){
            
                u.Password = SecurityHelper.HashPassword(u.Password);
            }
            
            UnitOfWork.Commit();
        }

        public bool IsAvailableUsername(string username)
        {
            return FirstOrDefault(p=>p.UserName == username) == null;
        }

        public bool ChangePassword(int uid, string oldPassword, string newPassword)
        {
            var user = FirstOrDefault(p => p.UserID == uid);
            if (user != null)
            {
                string oldPasswordHashed = SecurityHelper.HashPassword(oldPassword);
                if (oldPasswordHashed == user.Password)
                {
                    user.Password = SecurityHelper.HashPassword(newPassword);
                    UnitOfWork.Commit();
                    return true;
                }
            }
            return false;

        }
    }
}
