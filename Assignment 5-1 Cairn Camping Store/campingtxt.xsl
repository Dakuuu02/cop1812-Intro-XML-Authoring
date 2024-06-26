<?xml version="1.0" encoding="UTF-8" ?>
<!--
   New Perspectives on XML, 3rd Edition
   Tutorial 5
   Case Problem 4

   Cairn Camping Store XSLT Style Sheet
   Author: Dakshesh Kaki
   Date: 6/26/2024

   Filename: campingtxt.xsl
   Supporting Files: campingtx.xml
-->

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
   <xsl:output method="html" />

   <xsl:template match="/">
      <html>
         <head>
            <title>Cairn Camping Store</title>
            <style>
               body {
                  font-family: Arial, sans-serif;
               }
               table {
                  width: 100%;
                  border-collapse: collapse;
                  margin-bottom: 20px;
               }
               th, td {
                  border: 1px solid #ddd;
                  padding: 8px;
               }
               th {
                  background-color: #FFFFFF;
               }
            </style>
         </head>
         <body>
            <h1>Cairn Camping Store</h1>
            <xsl:for-each select="customers/customer">
               <table>
                  <tr>
                     <th colspan="2">Customer Information</th>
                  </tr>
                  <tr>
                     <td>Name</td>
                     <td><xsl:value-of select="name" /></td>
                  </tr>
                  <tr>
                     <td>Address</td>
                     <td>
                        <xsl:value-of select="street" /><br />
                        <xsl:value-of select="city" />, <xsl:value-of select="state" /> <xsl:value-of select="zip" />
                     </td>
                  </tr>
                  <tr>
                     <td>Customer ID</td>
                     <td><xsl:value-of select="@cid" /></td>
                  </tr>
               </table>

               <xsl:for-each select="orders/order">
                  <table>
                     <tr>
                        <th colspan="4">Order Information</th>
                     </tr>
                     <tr>
                        <td>Date</td>
                        <td><xsl:value-of select="date" /></td>
                        <td>Order ID</td>
                        <td><xsl:value-of select="@oid" /></td>
                     </tr>
                     <tr>
                        <th>Item No.</th>
                        <th>Description</th>
                        <th>Qty</th>
                     </tr>
                     <xsl:for-each select="item">
                        <xsl:sort select="qty" data-type="number" order="descending"/>
                        <xsl:sort select="@iid" order="ascending"/>
                        <tr>
                           <td><xsl:value-of select="@iid" /></td>
                           <td><xsl:value-of select="description" /></td>
                           <td><xsl:value-of select="qty" /></td>
                        </tr>
                     </xsl:for-each>
                  </table>
               </xsl:for-each>
            </xsl:for-each>
         </body>
      </html>
   </xsl:template>
</xsl:stylesheet>
