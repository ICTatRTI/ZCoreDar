/*
 *    Copyright 2003 - 2012 Research Triangle Institute
 *
 *    Licensed under the Apache License, Version 2.0 (the "License");
 *    you may not use this file except in compliance with the License.
 *    You may obtain a copy of the License at
 *
 *        http://www.apache.org/licenses/LICENSE-2.0
 */

package org.rti.zcore.dar.utils;

import java.io.BufferedWriter;
import java.io.ByteArrayOutputStream;
import java.io.FileNotFoundException;
import java.io.FileWriter;
import java.io.IOException;
import java.io.StringReader;
import java.io.Writer;

import javax.xml.transform.Source;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactoryConfigurationError;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.rti.zcore.Constants;
import org.rti.zcore.Register;
import org.rti.zcore.dar.gen.PatientItem;
import org.rti.zcore.dar.gen.report.UserInfoReport;
import org.rti.zcore.dar.report.valueobject.ARTCombinedPatient;
import org.rti.zcore.dar.report.valueobject.DrugReport;
import org.rti.zcore.dar.report.valueobject.OIPatient;
import org.rti.zcore.dar.report.valueobject.RegimenReport;

import com.sun.org.apache.xml.internal.utils.WrappedRuntimeException;
import com.thoughtworks.xstream.XStream;

public class ReportOutput {

    /**
     * Commons Logging instance.
     */
    private static Log log = LogFactory.getFactory().getInstance(ReportOutput.class);

	/**
	 * Renders an Excel-friendly version of a report by transforming an XML object through an XSLT template.
	 * This report aliases some DAR app-specific classes.
	 * @param reportName
	 * @param report
	 * @param clazz
	 * @param pathXml - path to the xml file that will be created from the report object.
	 * @param pathExcel - path to save the excel .xls file that is generated by the XSLT transformation.
	 * @param xslFile - if null, Constants.REPORTS_XSL_PATH + Constants.pathSep + reportName + ".xsl";
	 * @return string indicating success or failure.
	 * @throws IOException
	 * @throws TransformerFactoryConfigurationError
	 */
	public static void outputReport(String reportName, Register report, Class clazz, String pathXml, String pathExcel, String xslFile) throws IOException,
			TransformerFactoryConfigurationError, FileNotFoundException, TransformerException, WrappedRuntimeException {
		XStream xstream = new XStream();
		xstream.alias(reportName, clazz);
		xstream.alias("UserInfoReport", UserInfoReport.class);
		xstream.alias("ARTCombinedPatient", ARTCombinedPatient.class);
		xstream.alias("OIPatient", OIPatient.class);
		xstream.alias("PatientItem", PatientItem.class);
		xstream.alias("RegimenReport", RegimenReport.class);
		xstream.alias("DrugReport", DrugReport.class);
		//xstream.addImplicitMap(ARTRegimenReport.class, "regimenReportMap", "regimenCount", Integer.class, "regimenName");
		//xstream.useAttributeFor(HashMap.class, "entry");
		//xstream.addImplicitMap(ARTRegimenReport.class, "regimenReportMap", Integer.class, "regimenName");
		xstream.setMode(XStream.NO_REFERENCES);
		String output = xstream.toXML(report);
		Writer writer = new BufferedWriter(new FileWriter(pathXml));
		writer.write("<?xml version=\"1.0\"?>\n");
		writer.write(output);
		writer.flush();
		writer.close();
		StringReader sr = new StringReader(output);
		Source xmlSource = new javax.xml.transform.stream.StreamSource(sr);
		// 1. Instantiate a TransformerFactory.
		javax.xml.transform.TransformerFactory tFactory = javax.xml.transform.TransformerFactory.newInstance();
		// 2. Use the TransformerFactory to process the stylesheet Source and generate a Transformer.
		if (xslFile == null) {
			xslFile = Constants.REPORTS_XSL_PATH + Constants.pathSep + reportName + ".xsl";
		}
		// 3. Use the Transformer to transform an XML Source and send the output to a Result object.
		javax.xml.transform.Transformer transformer = tFactory.newTransformer(new javax.xml.transform.stream.StreamSource(xslFile));
		java.io.FileOutputStream outputStream = new java.io.FileOutputStream(pathExcel);
		transformer.transform(xmlSource, new javax.xml.transform.stream.StreamResult(outputStream));
		outputStream.flush();
		outputStream.close();
	}

	public static ByteArrayOutputStream outputReport(String reportName, Register report, Class clazz, String pathXml) throws IOException,
	TransformerFactoryConfigurationError, FileNotFoundException, TransformerException, WrappedRuntimeException {
		XStream xstream = new XStream();
		xstream.alias(reportName, clazz);
		xstream.alias("UserInfoReport", UserInfoReport.class);
		xstream.alias("ARTCombinedPatient", ARTCombinedPatient.class);
		xstream.alias("OIPatient", OIPatient.class);
		xstream.alias("PatientItem", PatientItem.class);
		xstream.setMode(XStream.NO_REFERENCES);
		String output = xstream.toXML(report);
		Writer writer = new BufferedWriter(new FileWriter(pathXml));
		writer.write("<?xml version=\"1.0\"?>\n");
		writer.write(output);
		writer.flush();
		writer.close();
		StringReader sr = new StringReader(output);
		Source xmlSource = new javax.xml.transform.stream.StreamSource(sr);
		// 1. Instantiate a TransformerFactory.
		javax.xml.transform.TransformerFactory tFactory = javax.xml.transform.TransformerFactory.newInstance();
		// 2. Use the TransformerFactory to process the stylesheet Source and generate a Transformer.
		String xslFile = Constants.REPORTS_XSL_PATH + Constants.pathSep + reportName + ".xsl";
		// 3. Use the Transformer to transform an XML Source and send the output to a Result object.
		javax.xml.transform.Transformer transformer = tFactory.newTransformer(new javax.xml.transform.stream.StreamSource(xslFile));
		//java.io.FileOutputStream outputStream = new java.io.FileOutputStream(pathExcel);
		java.io.ByteArrayOutputStream outputStream = new java.io.ByteArrayOutputStream();
		transformer.transform(xmlSource, new javax.xml.transform.stream.StreamResult(outputStream));
		return outputStream;
	}

}
