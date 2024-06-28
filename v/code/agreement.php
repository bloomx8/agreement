<!DOCTYPE html>
< lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Agreement</title>
    <link rel="stylesheet" href="agreement.css" />
    <script type="module">
        //
        //Import the agreement class
        import { agreement } from "./agreement.js";
        //
        // Show the makubaliano page
        window.onload = async () => {
            //
            // Create the agreement class instance
            const page = new agreement();
            //
            // Expose the page outside of this html
            window.page = page;
            //
            // Show the makubaliano
            await window.page.show_panels();

        };
    </script>
   
</head>head
<body>
    <div id="header">
        <h1>Rental Agreement</h1> 
        <fieldset>
            <legend> Search For </legend>
            Keyword <input type="text" id="keyword">
            <button onclick="page.search()">Go</button>
        </fieldset>
        <button >Collapse Document</button>
        <button >Extract Data</button>
        <button onclick="window.print()">Print</button>
        <button >Go to next search</button>
    </div>
    <div id="services">
        <fieldset>
            <legend> Select Client </legend>
            <select id="tenants" onchange="page.fill_template_with_details()">
        <option value="None"></option>
        <option value="lilian">Lilian Kariuki advocates (lilian)</option>
        <option value="coop" >The Cooperative Bank of Kenya (coop)</option>
        <option value="baltic" >KENTAGON ENTERPRISES (baltic)</option>
        <option value="pejmena" >PEJMENA LEGACY LIMITED (pejmena)</option>
        <option value="kanchori" >Kanchori Daniel and Co. Advocates (kanchori)</option>
        <option value="mzalendo" >Mzalendo saba saba Party of Kenya (mzalendo)</option>
        <option value="oigilal">Oigilal Properties (oigilal)</option>
        <option value="archihub" >Archihub Construction Limited</option>
    </select>

        </fieldset>
        <details>
            <summary onclick="background(this)">0. Parties Of the Agreement </summary>
        </details>
        <details>
            <summary onclick="background(this)">1. Rights of Tenant </summary>
        </details>
        <details>
            <summary onclick="background(this)">2. Covenants and agreements </summary>
            <details>
                <summary>rent payment</summary>
            </details>
            <details>
                <summary>VAT</summary>
            </details>
            <details>
            <summary>Deposits</summary>
            </details>
            <details>
            <summary>Utility</summary>
            </details>
            <details>
            <summary>suppliers</summary>
            </details>
            <details>
            <summary>Possession conditions</summary>
            </details>
            <details>
            <summary>Misuse</summary>
            </details>
            <details>
            <summary>Maintenance</summary>
            </details>
            <details>
            <summary>Obstruction.</summary>
            </details>
            <details>
            <summary>Commencement of the term.</summary>
            </details>
            <details>
            <summary>Tenant Responsibility.</summary>
            </details>
            <details>
            <summary>Permission for Inspection.</summary>
            </details>
            <details>
            <summary>Examining Premise Condition.</summary>
            </details>
            <details>
                <summary>Tenant Liability.</summary>
            </details>
            <details>
                 <summary>Tenant Liability.</summary>
                </details>
            <details>
                <summary>Making by the Consent of the Landlord</summary>
            </details>
            <details>
            <summary>Landlord Payment.</summary>
            </details>
            <details>
                <summary>Insurance</summary>
            </details>
            <details>
            <summary>Condition for Insurance.</summary>
            </details>
            <details>
            <summary>Insurance effected.</summary>
            </details>
            <details>
            <summary>Subletting.</summary>
            </details>
            <details>
            <summary>Usage Requirement.</summary>
            </details>
            <details>
            <summary>Advertising in the Premises.</summary>  
            </details>
            <details>
            <summary>Fire Burning.</summary>
            </details>
            <details>
            <summary>Interferences</summary>
            </details>
            <details>
            <summary>Fire Equipment</summary>
            </details>
            <details>
            <summary>Tenant Observation</summary>
            </details>
            <details>
            <summary>Law Compliance.</summary>
            </details>
            <details>
            <summary>Display of Particulars.</summary>
            </details>
            <details>
            <summary>Permitting the Landlord and Agents.</summary>
            </details>
            <details>
            <summary>Executing Proceedings.</summary>
            </details>
            <details>
            <summary>Term Expiry.</summary>
            </details>
            <details>
            <summary>Cost Payment.</summary>
            </details>
            <details>
            <summary>Additional Rental Service charge.</summary>
            </details>
           
        </details>
        <details>
            <summary onclick="background(this)">3. Additional obligation of the tenants. </summary>
        </details>
        <details>
            <summary onclick="background(this)">4. Obligations of the landlord. </summary>
        </details>
        <details>
            <summary onclick="background(this)">5. Agreement and declaration. </summary>
        </details>
        <details>
            <summary onclick="background(this)">6. Conditions of the landlord. </summary>
        </details>
        <details>
            <summary onclick="background(this)" class="selected">7. Termination of the agreement. </summary>
        </details>
        <details>
            <summary onclick="background(this)">8. Conditions of either tenant and landlord </summary>
        </details>
        <details>
            <summary onclick="background(this)">9. Agreement </summary>
        </details>
        <details>
            <summary onclick="background(this)">10. THE SCHEDULES HEREINBEFOREREFERRED TO: </summary>
        </details>
        <details>
            <summary onclick="background(this)">11. In the Witness of</summary>
        </details>
    </div>
    <div id="content"></div>
    <div id="event">EVENT</div>
    <div id="message">MESSAGE</div>
</body>
</html>
