using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Reflection;
using System.Data.Objects.DataClasses;

namespace GMR.Common.Extensions
{
    public static class ObjectExtensions
    {
        public static void SetProperty(this object targetObject, string property, object value)
        {
            var targetProperty = targetObject.GetType().GetProperty(property);
            if (targetProperty != null)
            {
                targetProperty.SetValue(targetObject,value, null);
            }
        }
        public static void CopyPropertiesFrom(this object targetObject, object source, params string [] ignoreProperties)
        {
            PropertyInfo[] allProporties = source.GetType().GetProperties();
            PropertyInfo targetProperty;

            foreach (PropertyInfo fromProp in allProporties.Where(p=> !ignoreProperties.Contains(p.Name)))
            {
                try
                {

                    targetProperty = targetObject.GetType().GetProperty(fromProp.Name);
                    if (targetProperty == null) continue;
                    if (!targetProperty.CanWrite) continue;

                    //if (targetObject.GetType().IsBuiltInType()) continue;
                    if (targetObject.GetType() == typeof(EntityReference<EntityObject>)) continue;
                    ////check if property in target class marked with SkipProperty Attribute
                    if (targetProperty.GetCustomAttributes(typeof(EdmRelationshipNavigationPropertyAttribute), true).Length != 0) continue;

                    //if (targetProperty.GetCustomAttributes(typeof(PropertySubEntity), true).Length != 0)
                    //{
                    //    //Type pType = targetProperty.PropertyType;
                    //    var targetProp = targetProperty.GetValue(targetObject, null);
                    //    var sourceProp = fromProp.GetValue(source, null);

                    //    targetProp.CopyPropertiesFrom(sourceProp); // <== PROBLEM HERE
                    //    //targetProperty.SetValue(targetObject, sourceEntity, null);

                    //}
                    //else
                    targetProperty.SetValue(targetObject, fromProp.GetValue(source, null), null);
                }
                catch (Exception)
                {


                }
            }
        }
    }
}
