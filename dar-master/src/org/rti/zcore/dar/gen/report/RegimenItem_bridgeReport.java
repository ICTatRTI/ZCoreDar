package org.rti.zcore.dar.gen.report;

import org.rti.zcore.EncounterData;
import org.rti.zcore.Patient;
import java.sql.Date;
import java.util.Set;
import java.sql.Time;
import java.sql.Timestamp;
import org.rti.zcore.AuditInfo;
import java.util.TreeSet;

/**
 * JavaBean RegimenItem_bridgeReport generated from database;
 * generated by DynasiteSourceGenerator, inspired by XslBeanGenerator by Klaus Berg.
 *
 * @author Chris Kelley
 *         Date: 2012-09-14
 *         Time: 11:43:50
 *         Form Name: Regimen Item
 *         Form Id: 181
 */

/**
 * @hibernate.joined-subclass table="regimen_item_bridge"
 * @hibernate.joined-subclass-key column="id"
 */
public class RegimenItem_bridgeReport extends EncounterData {

private transient Long regimen_id;	//regimen_id field204
private String regimen_idR;
private transient Long item_id;	//item_id field205
private String item_idR;


 /**
  * @return
  * @hibernate.property column="regimen_id"
  */
    public Long getRegimen_id() {
        return this.regimen_id;
    }

    public void setRegimen_id(Long regimen_id) {
        this.regimen_id = regimen_id;
    }



    public String getRegimen_idR() {
        return this.regimen_idR;
    }

    public void setRegimen_idR(String regimen_idR) {
        this.regimen_idR = regimen_idR;
    }



 /**
  * @return
  * @hibernate.property column="item_id"
  */
    public Long getItem_id() {
        return this.item_id;
    }

    public void setItem_id(Long item_id) {
        this.item_id = item_id;
    }



    public String getItem_idR() {
        return this.item_idR;
    }

    public void setItem_idR(String item_idR) {
        this.item_idR = item_idR;
    }



}
