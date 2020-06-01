<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0"
   xmlns:ebml="https://ietf.org/cellar/ebml" exclude-result-prefixes="ebml">
  <xsl:output encoding="UTF-8" method="xml" version="1.0" indent="yes"/>

  <xsl:template match="ebml:EBMLSchema">
    <h1>Legend</h1>

    <p>
      <ul>
        <li>Element Name — The full name of the described element</li>
        <li>L — The level within an EBML tree that the element may occur at. + is for a recursive level (can be its own child). g: global element (can be found at any level)</li>
        <li>EBML ID — The Element ID displayed as octets</li>
        <li>Ma — "mand." means that the element is mandatory and must be present if the parent element is present unless the element has a default value</li>
        <li>Mu — "mult." means that the element may occur multiple times as a child of the same parent</li>
        <li>Rng — Valid range of values to store in the element</li>
        <li>Default — The default value of the element to use if the parent element is present but this element is not</li>
        <li>T — The element's type, the form of data the element contains (m: master; b: binary; f: floating point number; u: unsigned integer; i: signed integer; 8: Unicode string; s: ASCII string; d: date &amp; time)</li>
        <li>1, 2, 3, 4 — the Matroska specification versions this element is contained in (v4 is still work in progress; additions and changes are possible)</li>
        <li>W — All elements available for use in WebM.</li>
        <li>Description — A short description of the element's purpose.</li>
      </ul>
    </p>

    <xsl:call-template name="GenerateTable">
      <xsl:with-param name="GitRevision" select="$GitRevision" />
    </xsl:call-template>
  </xsl:template>

  <xsl:include href="../../specification/transforms/ebml_schema2spec_common.xsl"/>

</xsl:stylesheet>
