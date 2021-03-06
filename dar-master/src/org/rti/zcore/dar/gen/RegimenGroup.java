package org.rti.zcore.dar.gen;

import org.rti.zcore.dar.gen.*;
import org.rti.zcore.EncounterData;
import org.rti.zcore.Patient;
import java.sql.Date;
import java.util.Set;
import java.sql.Time;
import java.sql.Timestamp;
import org.rti.zcore.AuditInfo;
import java.util.TreeSet;

/**
 * JavaBean RegimenGroup generated from database;
 * generated by DynasiteSourceGenerator, inspired by XslBeanGenerator by Klaus Berg.
 *
 * @author Chris Kelley
 *         Date: 2012-09-14
 *         Time: 11:43:47
 *         Form Name: Regimen Group
 *         Form Id: 128
 */

/**
 * @hibernate.joined-subclass table="regimen_group"
 * @hibernate.joined-subclass-key column="id"
 */
public class RegimenGroup extends EncounterData {

private String name;	//name field2143
private String code;	//code field2298


 /**
  * @return
  * @hibernate.property column="name"
  */
    public String getName() {
        return this.name;
    }

    public void setName(String name) {
        this.name = name;
    }





 /**
  * @return
  * @hibernate.property column="code"
  */
    public String getCode() {
        return this.code;
    }

    public void setCode(String code) {
        this.code = code;
    }





}
