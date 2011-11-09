using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.ComponentModel.DataAnnotations;
using System.Reflection;
using GMR.Biz;

namespace GMR.App.Areas.Administration.Models
{
    [AttributeUsage(AttributeTargets.Class)]
    public class UserConstraintAttribute : ValidationAttribute
    {
        public String UserIdField { get; set; }
        public string EmailField { get; set; }
        public string UsernameField { get; set; }
        public UserConstraintAttribute(string emailField, string username)
        {
            //UserIdField = userIdField;
            EmailField = emailField;
            UsernameField = username;
        }
          public override Boolean IsValid(Object value)
        {
            Type objectType = value.GetType();
            //PropertyInfo piUser = objectType.GetProperties()
            //                          .Where(p => p.Name == UserIdField)
            //                          .FirstOrDefault();

            PropertyInfo piEmail = objectType.GetProperties()
                                .Where(p => p.Name == EmailField)
                                .FirstOrDefault();

            PropertyInfo piUsername = objectType.GetProperties()
                                .Where(p => p.Name == UsernameField)
                                .FirstOrDefault();

            if (piEmail == null || piUsername == null)
            {
                throw new ApplicationException("UserConstraintAttribute error on " + objectType.Name);
            }

            //int uid = Convert.ToInt32(piUser.GetValue(value, null));
            string email = Convert.ToString(piEmail.GetValue(value, null));
            string username = Convert.ToString(piUsername.GetValue(value, null));
            UserService service = new UserService();
            return service.IsAvailableEmail(0, email) && service.IsAvailableUsername(username);
        }
    }


    
    //property - http://msdn.microsoft.com/en-us/library/cc668224.aspx
    [AttributeUsage(AttributeTargets.Class)]
    public class UniqueUserEmailAttribute : ValidationAttribute
    {
        //
        // GET: /Administration/UniqueEmailAttribute/
        public UniqueUserEmailAttribute(string userIdField, string emailField)
        {
            UserIdField = userIdField;
            EmailField = emailField;
        }
        public String UserIdField { get; set; }
        public string EmailField { get; set; }

        public override Boolean IsValid(Object value)
        {
            Type objectType = value.GetType();
            PropertyInfo piUser = objectType.GetProperties()
                                      .Where(p => p.Name == UserIdField)
                                      .FirstOrDefault();

            PropertyInfo piEmail = objectType.GetProperties()
                                .Where(p => p.Name == EmailField)
                                .FirstOrDefault();


            if (piUser == null || piEmail == null)
            {
                throw new ApplicationException("UniqueUserEmailAttribute error on " + objectType.Name);
            }

            int uid = Convert.ToInt32(piUser.GetValue(value, null));
            string email = Convert.ToString(piEmail.GetValue(value, null));
            UserService service = new UserService();
            return service.IsAvailableEmail(uid, email);
        }
    }

}

