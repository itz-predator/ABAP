# Day 7: SAP Workflow, Fiori & Final Revision
## SAP Workflow: Workflow Builder
- The workflow definition is the set of rules that determine the path that the process takes. For example, how a Leave request is processed from initial to end.
## Basic terminology used in the workflow: 

### - Tasks are the steps in the process, which have to be performed either by people or automatically by the software. 

### - Workflow Instance, which is often simply referred to as the workflow, is a single workflow run.

### - Work item is the task instance that is performed as a single workflow step.

### - Agents are the people who process the tasks (via the work items).

### - Container is the place where all the data used in the workflow is collected.

### - Binding is the set of rules that define which data is passed to which part of the process.

## T-code SWDD (Work flow Builder)
- ![image](https://github.com/user-attachments/assets/e3f17b5f-2644-48c0-826d-aa6639e27d65)
  ## The initial workflow screen has the following parts:

### 1.The start of the workflow definition, indicated by  Workflow Started.

### 2.The end of the workflow definition, indicated by   Workflow Completed.

### 3.The area in which you insert the new workflow definition is indicated by Undefined Double-click for new step.

## Step 2: Now select the undefined step and select Create step or double click the undefined step. 

- Among the different steps chose the User Decision by double clicking on it.
- ![image](https://github.com/user-attachments/assets/96f17971-32de-45ef-9ba3-60e1f0dcd1f5)
- By Clicking on User Decision, it navigates to a window where we can define the terms like approve or reject.

- Provide the Title and decision texts, then click on Transfer and to Graphic button as shown in below screen shot.
- ![image](https://github.com/user-attachments/assets/8c17042b-edd3-46af-8f6f-a0f175958777)
- By clicking on Transfer button, a popup will appears for requesting for the abbreviation and the name for this task.
- Enter the same and press enter.
- ![image](https://github.com/user-attachments/assets/931f4153-ce2f-4ff2-a8a2-2098c5e44990)

  ## Step 3: Now enter you package and press enter.

- Now select Transfer and to graphic button. Following screen appears:
- ![image](https://github.com/user-attachments/assets/67dedacb-5c74-4040-a461-0a64e26ffe6d)
- Now we need to include a mail step to be sent to the requestor. Now select the line “Approve” and do a right click. Different options on shown on the context menu. Select Create button.
- ![image](https://github.com/user-attachments/assets/b0819f75-3a4b-45af-a12b-d54814fdae60)
- Now select the step “Send Mail” from the list.
- ![image](https://github.com/user-attachments/assets/73e30a21-e6ff-4df6-b2af-2d05ae09ced8)
- Now enter the subject and the body of the message for the mail to be sent.
- ![image](https://github.com/user-attachments/assets/78ed1ce7-37fb-47b5-babe-2fcdcc812143)
- Follow the same step(Approve) for the step “Reject”. The following screen appears
- ![image](https://github.com/user-attachments/assets/f92bdcae-fb14-4d9e-8da9-c6d39496d0bf)
- Press SAVE to save the workflow application. You need to enter an abbreviation and name for your workflow. You can change any of these at any later point. After saving, a number is assigned to your workflow starting with WS.

Output:

- Click on Execute button. The following screen appears
- ![image](https://github.com/user-attachments/assets/5975f4f8-0f4c-42c6-8031-b17e00600b67)
- Choose one among Approve  or Reject as part of the user decision. He can select the third option to retain the work item in his inbox and make the decision later.

- Now suppose that the recipient has chosen one of the first options. Now a mail would be sent to the requestor with the status of his request(you can see the mail status in SOST Tcode).
- ![image](https://github.com/user-attachments/assets/34c1f79d-74cd-4704-bf7c-736c29576adb)
- Finally we achieved it, we can approve or reject the leave request using Workflow.















## Business Objects
- Business Object in SAP Business Workflow is defined as a collection of methods or events for an entity in business process. Few common Business Objects in SAP system include: Customer, Material, and Vendor. With the use of Business Objects, all services are provided in the form of executable methods.
- An object in the Workflow represents a Business entity in SAP system. Common entity example includes: Purchase Order, Material, Vendor, etc.
- TCODE - SWO1
# Events
- An event affects the flow of the process.

## The workflow capability editor supports the following events:

### Start event: Indicates where a workflow starts and what triggers a workflow. Start events have no incoming sequence flow. Each workflow has one start event.

### Intermediate Message Event: Process steps where the respective workflow instance waits for a message before the flow commences in the respective control flow branch.

### Intermediate Timer Event: Allows a workflow to pause and resume after a specified interval of time.

### End event: An event with no specific result. End events have no outgoing sequence flow. Consider a workflow that has several branches, the workflow terminates only after all the branches are executed.

### Terminate end event: The terminate event ends the workflow in a regular way. But, consider a workflow consists of multiple branches and you choose one branch as a terminate end event. The workflow terminates when the branch marked as terminate end is executed without waiting for other branches to get executed.


# Deadline Monitoring
- Deadline monitoring is a workflow runtime system function that monitors the start and end deadlines for the processing of selected work items in an approval process.

The following deadlines are already considered in the workflow templates WS40000016 (Approval Workflow) and WS40000017 (Completion Workflow):

- Latest Start Date/Time

- Requested End Date/Time

- Latest End Date/Time
  
# SAP Fiori: Architecture -
- The SAP Fiori architecture introduces the high-level architecture of SAP Fiori.

- The SAP Fiori apps are built with SAPUI5 technology for web applications and iOS native and can be used on smartphones, tablets, and desktop computers. The SAP Fiori launchpad is used to launch and run the apps.
- The business data that is consumed in the apps is retrieved at runtime from the back-end systems by using OData services.
-  ![image](https://github.com/user-attachments/assets/112a1637-b3b8-4999-9b3c-6bc057dd354c)

## Launchpad Configuration
- SAP Fiori launchpad is a shell that hosts SAP Fiori apps and provides the apps with services such as navigation, personalization, embedded support, and application configuration.
- SAP Fiori launchpad is the entry point to SAP Fiori apps on mobile and desktop devices.
  ### FLP Configurations Steps


- We will complete the configurations by following these steps notice that this example has been done on S/4 HANA 2020 release  :
- ![image](https://github.com/user-attachments/assets/5f7ffdc9-2c1a-40f4-bbc7-7a82f786c5d0)
- Follow link for more ->https://community.sap.com/t5/technology-blogs-by-sap/fiori-launchpad-configuration-your-6-steps-guide-to-a-customized-experience/ba-p/13568479



## Fiori Elements
- SAP Fiori elements is a framework that comprises the most commonly used floorplan templates and is designed to:

- Speed up development by reducing the amount of frontend code needed to build SAP Fiori apps.
- Drive UX consistency and compliance with the latest SAP Fiori design guidelines.
## Annotations
- Annotations in OData V2 and OData V4
- Annotations are descriptive information for OData Service.

- The OData V2 protocol allows you to add annotations to the metadata document. The purpose of the annotations is to add information and hints to the Entity Data Model elements.

# Hands-on: Develop a workflow for Purchase Order Approval
- Approval Workflows for Purchase Orders and Change Versions
0-step approval workflow (WS14000075)
- This workflow starts if, according to the start conditions, no approval is required. As a result, the purchase order (PO) is released or the changes to the purchase order change version (PO-CV) are transferred to the active document.

1-step approval workflow (WS14000089)
- This workflow requires approval of the PO / PO-CV by the manager of the relevant purchasing organization. If the manager approves, the PO/ PO-CV is released; if he rejects, the PO/ PO-CV gets the status rejected, the workflow is terminated and the creator can reprocess the PO/ PO-CV and submit it for approval again.

- You define the authorization for adding/removing approvers or reviewers in the processor assignment for workflow template WS14000089 in Customizing for SAP Supplier Relationship Management under SRM Server  Cross-Application Basic Settings  Business Workflow  Application-Controlled Workflow  Technical Configuration  Perform Task-Specific Customizing.
-   n-step approval workflow (WS14000145)
- This workflow is intended for longer (more than 2-step) approval processes where it is necessary that the approver and the creator can both make changes to the PO / PO-CV during the approval process without the workflow being interrupted and having to be restarted.
# Create a Fiori List Report with CDS annotations.
- Created and Implemented on SAP BTP Fiori and Deployed on CF.
