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















## Business Objects, Events, Tasks, Deadline Monitoring
# SAP Fiori: Architecture, Launchpad Configuration, Fiori Elements, Annotations
# Final Revision: Review key concepts, Code Debugging Practice, Real-world Scenarios
# Hands-on: Develop a workflow for Purchase Order Approval, Create a Fiori List Report with CDS annotations.
