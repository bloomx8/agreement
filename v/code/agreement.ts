//true
//Import the page class from our library
import { exec } from "../../../schema/v/code/server.js";
import {page} from "../../../outlook/v/code/view.js";
//
//This is the class for manipulating the agreement
export class agreement extends page{
    //
    //The class constructor
    constructor(){
        super();
    }
    
    //Fill the makubakiano temolate with details of the selected client         
    async fill_template_with_details() {
        //
        // 1. Get the select html element; it has the id 'tenants'
        //
        //1.1 Get the html element that has the id 'tenant'
        const element:HTMLElement|null = document.getElementById('tenants'); 
        //
        //1.2 If there is no such element, then stop this program and alsert\
        //the user
        if (element===null) throw new Error(`Element not found`);
        //
        //2. Get the selected option value; that is the id of te client
        const client:string = (<HTMLSelectElement>element).value;
        //
        //1 Formulate the sql for retrieving the client's contract details
        const sql = 
        `select
            tenant.id as client_id,
            tenant.name as 'client_name',  
            contract.*
        from 
            contract
            inner join tenant on contract.tenant=tenant.tenant
        where
            tenant.id='${client}'
        `;
        //2 Execute the sql to get the data
        const result =  await exec ('database', ['agreement'], 'get_sql_data', [sql]);
        //
        //3 Show the retrieved results on the console log
        console.log(result);
        
        //4 From the data, get the tenant's code

        //5 Look for the document element that matches the client's name
        //Check your code

        //6Change the text content of that elto to that of the clients name
        //Check your earlier code 
    }
        
    //
    //Read the makubaliano content from the html document and display it in the
    //main page
    async show_panels():Promise<void>{
        //
        //Get the destination where to paste the makubaliano
        const dest:HTMLElement = this.get_element("content");
        //
        //Request for the content of the specified file
        const makubaliano:Response = await fetch("./makubaliano.html");
        //
        //If there was no problem with the client server communication append 
        //the makubaliano to the destination
        if(makubaliano.ok) dest.innerHTML = await makubaliano.text();
        //
        //Populate the select with the tennants form the database
        this.populate_select();
    }
    //
    //Populate the select element in the document with the tennants form the database
    async populate_select():Promise<void>{
        //
        //Get the select element
        const select:HTMLSelectElement = this.get_element('tenants') as HTMLSelectElement;
        //
        //The sql to get the tenants
        const sql: string = 'SELECT id,name FROM `tenant`;';
        //
        //Get the tennants details form the database
        const results:Array<{id:string; name:string}> = await exec("database", ['agreement'], "get_sql_data",[sql])
        //
        //Go through all the clients and for each client create an option in the select
        results.forEach((result)=>{
            //
            //Create the option element
            const option:HTMLOptionElement = this.create_element('option', select, {
                value:result.id,
                textContent:`${result.name}(${result.id})`
            })
        })
    }
    //
    //This method will read the entered keyword and search for it through out the
    //makubaliano document. Everywhere there is a match, highlight it, and the 
    //detail where the word is located will open.
    async search(){
        //
        //1. Read the entered keyword
            
        //1.1 Get the input element
        const element= <HTMLInputElement>document.getElementById("keyword")!;
        //
        //1.2 Get the keyword from the input element
        const keyword:string = element.value;
        //
        //Search the keyword throught the document
        this.search_entire_document(keyword);
        
    }
    
    //This method will use the given entered keyword to search for it through out the
    //makubaliano document. Everywhere there is a match, highlight it, and the 
    //detail where the word is located will open.
    search_entire_document (keyword:string):void{
        
        //1.Get all the nodes in the document using a tree walker
        const walker:TreeWalker = this.get_text_nodes();
        //
        //List the members of the walker
        this.list_members(walker);
        
        //2.Filter those nodes where the keyword occurs
      
        //3.Highlight the keyword word in the filtered nodes
        
        //
        //4. Mark as opened all the detail tags that are ancestors of the 
        //filtered nodes
        
    }
    
    get_text_nodes():TreeWalker{
        //
        //Start searching from the body of the document.
        const body: Node= document.body;
        //
        //Only element nodes (that compises of our tree fragment) should  be 
        //considered
        const what_to_show: number= NodeFilter.SHOW_ELEMENT;
        //
        //Collect all our targets (i.e., those nodes with the data-id attribute)
        //as an array
        const targets:Array<Element> = Array.from(this.document.querySelectorAll("*[data-id]"));
        //
        //
        //Set up a filter for elements with the 'data-id' attribute
        const filter:NodeFilter = {
            acceptNode:(node:Node):number=>{
                //
                //Reject this node if it is not an element
                if(!(node instanceof Element)) return NodeFilter.FILTER_REJECT;
                //
                //Find the first target that is contained by the given node
                const result:Element|undefined= targets.find(target=>node.contains(target));
                //
                //Accept the node if the a target is found; otherwise reject it
                return result ? NodeFilter.FILTER_ACCEPT : NodeFilter.FILTER_REJECT
            }
        }
        //
        //Now create the walker
        const walker:TreeWalker = document.createTreeWalker(body, what_to_show, filter);
        //
        return walker;
    }
    
    //Walk through all the retrievd nodes and open every detail
    list_members(walker:TreeWalker){
        //
        while(walker.nextNode()){
            //
            //Get the current node
            const node:Node =walker.currentNode;
            //
            //Open the node, if it is a detail
            if (node instanceof  HTMLDetailsElement) node.open=true;
        }     
    }
}   
            
            
            
          
                         