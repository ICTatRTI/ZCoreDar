package org.rti.zcore.dar.gen.openmrs;

import org.rti.zcore.openmrs.OpenMRSEncounter;
import org.rti.zcore.openmrs.OpenMrsMultiValue;
import org.rti.zcore.openmrs.OpenMrsValue;

/**
 * JavaBean RegimenItem_bridge generated from database;
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
public class RegimenItem_bridge extends OpenMRSEncounter {

private OpenMrsValue regimen_id;	//regimen_id field204
private OpenMrsValue item_id;	//item_id field205


 /**
  * @return
  * @hibernate.property column="regimen_id"
  */
    public OpenMrsValue getRegimen_id() {
        return this.regimen_id;
    }

    public void setRegimen_id(OpenMrsValue regimen_id) {
        this.regimen_id = regimen_id;
    }





 /**
  * @return
  * @hibernate.property column="item_id"
  */
    public OpenMrsValue getItem_id() {
        return this.item_id;
    }

    public void setItem_id(OpenMrsValue item_id) {
        this.item_id = item_id;
    }





}