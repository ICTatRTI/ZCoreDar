package org.rti.zcore.dar.gen.openmrs;

import org.rti.zcore.openmrs.OpenMRSEncounter;
import org.rti.zcore.openmrs.OpenMrsMultiValue;
import org.rti.zcore.openmrs.OpenMrsValue;

/**
 * JavaBean UserInfo generated from database;
 * generated by DynasiteSourceGenerator, inspired by XslBeanGenerator by Klaus Berg.
 *
 * @author Chris Kelley
 *         Date: 2012-09-14
 *         Time: 11:43:50
 *         Form Name: User Data
 *         Form Id: 170
 */

/**
 * @hibernate.joined-subclass table="user_info"
 * @hibernate.joined-subclass-key column="id"
 */
public class UserInfo extends OpenMRSEncounter {

private OpenMrsValue username;	//username field2266
private OpenMrsValue password;	//password field2267
private OpenMrsValue email;	//email field2270
private OpenMrsValue forenames;	//forenames field2268
private OpenMrsValue lastname;	//lastname field2269
private OpenMrsValue mobile;	//mobile field2271
private OpenMrsValue phone;	//phone field2272


 /**
  * @return
  * @hibernate.property column="username"
  */
    public OpenMrsValue getUsername() {
        return this.username;
    }

    public void setUsername(OpenMrsValue username) {
        this.username = username;
    }





 /**
  * @return
  * @hibernate.property column="password"
  */
    public OpenMrsValue getPassword() {
        return this.password;
    }

    public void setPassword(OpenMrsValue password) {
        this.password = password;
    }





 /**
  * @return
  * @hibernate.property column="email"
  */
    public OpenMrsValue getEmail() {
        return this.email;
    }

    public void setEmail(OpenMrsValue email) {
        this.email = email;
    }





 /**
  * @return
  * @hibernate.property column="forenames"
  */
    public OpenMrsValue getForenames() {
        return this.forenames;
    }

    public void setForenames(OpenMrsValue forenames) {
        this.forenames = forenames;
    }





 /**
  * @return
  * @hibernate.property column="lastname"
  */
    public OpenMrsValue getLastname() {
        return this.lastname;
    }

    public void setLastname(OpenMrsValue lastname) {
        this.lastname = lastname;
    }





 /**
  * @return
  * @hibernate.property column="mobile"
  */
    public OpenMrsValue getMobile() {
        return this.mobile;
    }

    public void setMobile(OpenMrsValue mobile) {
        this.mobile = mobile;
    }





 /**
  * @return
  * @hibernate.property column="phone"
  */
    public OpenMrsValue getPhone() {
        return this.phone;
    }

    public void setPhone(OpenMrsValue phone) {
        this.phone = phone;
    }





}
