@IsTest
public class ZohoTicketJSON2Apex_Test {
	
	static testMethod void testParse() {
		String json = '{'+
		'  \"data\" : [ {'+
		'    \"webUrl\" : \"https://support.autorabit.com/support/autorabit/ShowHomePage.do#Cases/dv/241415000069945337\",'+
		'    \"contactId\" : \"241415000064463008\",'+
		'    \"departmentId\" : \"241415000000006907\",'+
		'    \"accountId\" : \"241415000064902193\",'+
		'    \"closedTime\" : \"2022-02-22T14:44:29.000Z\",'+
		'    \"priority\" : \"P2\",'+
		'    \"createdTime\" : \"2022-02-10T19:48:43.000Z\",'+
		'    \"statusType\" : \"Closed\",'+
		'    \"status\" : \"Closed\",'+
		'    \"subject\" : \"Update Salesforce API version to 53\",'+
		'    \"ticketNumber\" : \"41380\",'+
		'    \"id\" : \"241415000069945337\"'+
		'  }, {'+
		'    \"webUrl\" : \"https://support.autorabit.com/support/autorabit/ShowHomePage.do#Cases/dv/241415000069955027\",'+
		'    \"contactId\" : \"241415000069955001\",'+
		'    \"departmentId\" : \"241415000000006907\",'+
		'    \"accountId\" : null,'+
		'    \"closedTime\" : \"2022-02-11T00:27:20.000Z\",'+
		'    \"priority\" : \"P2\",'+
		'    \"createdTime\" : \"2022-02-10T20:52:02.000Z\",'+
		'    \"statusType\" : \"Closed\",'+
		'    \"status\" : \"Closed\",'+
		'    \"subject\" : \"Re: Salesforce Architect Program [ ref:_00D1I2yagN._5001IYquEz:ref ]\",'+
		'    \"ticketNumber\" : \"41383\",'+
		'    \"id\" : \"241415000069955027\"'+
		'  }, {'+
		'    \"webUrl\" : \"https://support.autorabit.com/support/autorabit/ShowHomePage.do#Cases/dv/241415000069947243\",'+
		'    \"contactId\" : \"241415000062672008\",'+
		'    \"departmentId\" : \"241415000000006907\",'+
		'    \"accountId\" : \"241415000030354471\",'+
		'    \"closedTime\" : \"2022-02-11T21:43:17.000Z\",'+
		'    \"priority\" : \"P2\",'+
		'    \"createdTime\" : \"2022-02-10T21:59:13.000Z\",'+
		'    \"statusType\" : \"Closed\",'+
		'    \"status\" : \"Closed\",'+
		'    \"subject\" : \"Reset user password\",'+
		'    \"ticketNumber\" : \"41384\",'+
		'    \"id\" : \"241415000069947243\"'+
		'  }, {'+
		'    \"webUrl\" : \"https://support.autorabit.com/support/autorabit/ShowHomePage.do#Cases/dv/241415000069914417\",'+
		'    \"contactId\" : \"241415000060165493\",'+
		'    \"departmentId\" : \"241415000000006907\",'+
		'    \"accountId\" : \"241415000031282628\",'+
		'    \"closedTime\" : \"2022-02-11T00:29:22.000Z\",'+
		'    \"priority\" : \"P3\",'+
		'    \"createdTime\" : \"2022-02-10T22:02:15.000Z\",'+
		'    \"statusType\" : \"Closed\",'+
		'    \"status\" : \"Closed\",'+
		'    \"subject\" : \"Unable to find the source org to retrieve the data. Importance - Critical\",'+
		'    \"ticketNumber\" : \"41385\",'+
		'    \"id\" : \"241415000069914417\"'+
		'  }, {'+
		'    \"webUrl\" : \"https://support.autorabit.com/support/autorabit/ShowHomePage.do#Cases/dv/241415000069945477\",'+
		'    \"contactId\" : \"241415000063440008\",'+
		'    \"departmentId\" : \"241415000000006907\",'+
		'    \"accountId\" : \"241415000018075041\",'+
		'    \"closedTime\" : \"2022-02-11T22:17:39.000Z\",'+
		'    \"priority\" : \"P2\",'+
		'    \"createdTime\" : \"2022-02-10T22:03:41.000Z\",'+
		'    \"statusType\" : \"Closed\",'+
		'    \"status\" : \"Closed\",'+
		'    \"subject\" : \"Validate and Merge is failing at the Merge Prevalidation Process\",'+
		'    \"ticketNumber\" : \"41386\",'+
		'    \"id\" : \"241415000069945477\"'+
		'  }, {'+
		'    \"webUrl\" : \"https://support.autorabit.com/support/autorabit/ShowHomePage.do#Cases/dv/241415000069957050\",'+
		'    \"contactId\" : \"241415000056862001\",'+
		'    \"departmentId\" : \"241415000000006907\",'+
		'    \"accountId\" : \"241415000000515257\",'+
		'    \"closedTime\" : null,'+
		'    \"priority\" : \"P2\",'+
		'    \"createdTime\" : \"2022-02-10T23:08:20.000Z\",'+
		'    \"statusType\" : \"On Hold\",'+
		'    \"status\" : \"Feature Request\",'+
		'    \"subject\" : \"SonarScanner Failure in ARM due to permissions\",'+
		'    \"ticketNumber\" : \"41387\",'+
		'    \"id\" : \"241415000069957050\"'+
		'  }, {'+
		'    \"webUrl\" : \"https://support.autorabit.com/support/autorabit/ShowHomePage.do#Cases/dv/241415000069977003\",'+
		'    \"contactId\" : \"241415000060682008\",'+
		'    \"departmentId\" : \"241415000000006907\",'+
		'    \"accountId\" : \"241415000015857535\",'+
		'    \"closedTime\" : \"2022-02-25T02:38:06.000Z\",'+
		'    \"priority\" : \"P3\",'+
		'    \"createdTime\" : \"2022-02-11T03:50:12.000Z\",'+
		'    \"statusType\" : \"Closed\",'+
		'    \"status\" : \"Closed\",'+
		'    \"subject\" : \"APEX PMD Scan\",'+
		'    \"ticketNumber\" : \"41393\",'+
		'    \"id\" : \"241415000069977003\"'+
		'  }, {'+
		'    \"webUrl\" : \"https://support.autorabit.com/support/autorabit/ShowHomePage.do#Cases/dv/241415000069977291\",'+
		'    \"contactId\" : \"241415000060682008\",'+
		'    \"departmentId\" : \"241415000000006907\",'+
		'    \"accountId\" : \"241415000015857535\",'+
		'    \"closedTime\" : \"2022-02-11T06:58:07.000Z\",'+
		'    \"priority\" : \"P0\",'+
		'    \"createdTime\" : \"2022-02-11T04:03:03.000Z\",'+
		'    \"statusType\" : \"Closed\",'+
		'    \"status\" : \"Closed\",'+
		'    \"subject\" : \"CLI\",'+
		'    \"ticketNumber\" : \"41395\",'+
		'    \"id\" : \"241415000069977291\"'+
		'  }, {'+
		'    \"webUrl\" : \"https://support.autorabit.com/support/autorabit/ShowHomePage.do#Cases/dv/241415000069977431\",'+
		'    \"contactId\" : \"241415000060682008\",'+
		'    \"departmentId\" : \"241415000000006907\",'+
		'    \"accountId\" : \"241415000015857535\",'+
		'    \"closedTime\" : \"2022-02-17T13:29:19.000Z\",'+
		'    \"priority\" : \"P2\",'+
		'    \"createdTime\" : \"2022-02-11T04:16:40.000Z\",'+
		'    \"statusType\" : \"Closed\",'+
		'    \"status\" : \"Closed\",'+
		'    \"subject\" : \"Build Fails due to Sequential execution\",'+
		'    \"ticketNumber\" : \"41396\",'+
		'    \"id\" : \"241415000069977431\"'+
		'  }, {'+
		'    \"webUrl\" : \"https://support.autorabit.com/support/autorabit/ShowHomePage.do#Cases/dv/241415000070019125\",'+
		'    \"contactId\" : \"241415000024049008\",'+
		'    \"departmentId\" : \"241415000000006907\",'+
		'    \"accountId\" : \"241415000069998824\",'+
		'    \"closedTime\" : \"2022-02-11T17:34:08.000Z\",'+
		'    \"priority\" : \"P2\",'+
		'    \"createdTime\" : \"2022-02-11T10:30:18.000Z\",'+
		'    \"statusType\" : \"Closed\",'+
		'    \"status\" : \"Closed\",'+
		'    \"subject\" : \"Update my email ID\",'+
		'    \"ticketNumber\" : \"41405\",'+
		'    \"id\" : \"241415000070019125\"'+
		'  }, {'+
		'    \"webUrl\" : \"https://support.autorabit.com/support/autorabit/ShowHomePage.do#Cases/dv/241415000070001103\",'+
		'    \"contactId\" : \"241415000068607221\",'+
		'    \"departmentId\" : \"241415000000006907\",'+
		'    \"accountId\" : \"241415000013590405\",'+
		'    \"closedTime\" : \"2022-05-11T09:13:43.000Z\",'+
		'    \"priority\" : \"P2\",'+
		'    \"createdTime\" : \"2022-02-11T11:54:01.000Z\",'+
		'    \"statusType\" : \"Closed\",'+
		'    \"status\" : \"Closed\",'+
		'    \"subject\" : \"Issue while creating release labels\",'+
		'    \"ticketNumber\" : \"41407\",'+
		'    \"id\" : \"241415000070001103\"'+
		'  }, {'+
		'    \"webUrl\" : \"https://support.autorabit.com/support/autorabit/ShowHomePage.do#Cases/dv/241415000070001256\",'+
		'    \"contactId\" : \"241415000070001230\",'+
		'    \"departmentId\" : \"241415000000006907\",'+
		'    \"accountId\" : \"241415000069846319\",'+
		'    \"closedTime\" : \"2022-02-11T12:40:32.000Z\",'+
		'    \"priority\" : \"P2\",'+
		'    \"createdTime\" : \"2022-02-11T12:27:18.000Z\",'+
		'    \"statusType\" : \"Closed\",'+
		'    \"status\" : \"Closed\",'+
		'    \"subject\" : \"Re: License not valid error\",'+
		'    \"ticketNumber\" : \"41409\",'+
		'    \"id\" : \"241415000070001256\"'+
		'  }, {'+
		'    \"webUrl\" : \"https://support.autorabit.com/support/autorabit/ShowHomePage.do#Cases/dv/241415000070001603\",'+
		'    \"contactId\" : \"241415000070001577\",'+
		'    \"departmentId\" : \"241415000000006907\",'+
		'    \"accountId\" : \"241415000070098255\",'+
		'    \"closedTime\" : \"2022-02-16T15:28:54.000Z\",'+
		'    \"priority\" : \"P2\",'+
		'    \"createdTime\" : \"2022-02-11T14:15:47.000Z\",'+
		'    \"statusType\" : \"Closed\",'+
		'    \"status\" : \"Closed\",'+
		'    \"subject\" : \"Issue with Codescan rule for Apex - Sharing should be Configured on Classes with DML\",'+
		'    \"ticketNumber\" : \"41412\",'+
		'    \"id\" : \"241415000070001603\"'+
		'  }, {'+
		'    \"webUrl\" : \"https://support.autorabit.com/support/autorabit/ShowHomePage.do#Cases/dv/241415000070029001\",'+
		'    \"contactId\" : \"241415000003525275\",'+
		'    \"departmentId\" : \"241415000000006907\",'+
		'    \"accountId\" : \"241415000003632105\",'+
		'    \"closedTime\" : \"2022-02-11T14:43:38.000Z\",'+
		'    \"priority\" : \"P2\",'+
		'    \"createdTime\" : \"2022-02-11T14:18:30.000Z\",'+
		'    \"statusType\" : \"Closed\",'+
		'    \"status\" : \"Closed\",'+
		'    \"subject\" : \"To confirm customer id for SSO\",'+
		'    \"ticketNumber\" : \"41414\",'+
		'    \"id\" : \"241415000070029001\"'+
		'  }, {'+
		'    \"webUrl\" : \"https://support.autorabit.com/support/autorabit/ShowHomePage.do#Cases/dv/241415000070019269\",'+
		'    \"contactId\" : \"241415000021350244\",'+
		'    \"departmentId\" : \"241415000000006907\",'+
		'    \"accountId\" : \"241415000023413363\",'+
		'    \"closedTime\" : \"2022-02-17T18:10:30.000Z\",'+
		'    \"priority\" : \"P2\",'+
		'    \"createdTime\" : \"2022-02-11T16:35:22.000Z\",'+
		'    \"statusType\" : \"Closed\",'+
		'    \"status\" : \"Closed\",'+
		'    \"subject\" : \"nCino Feature Template CI Jobs Fail to Deploy\",'+
		'    \"ticketNumber\" : \"41419\",'+
		'    \"id\" : \"241415000070019269\"'+
		'  }, {'+
		'    \"webUrl\" : \"https://support.autorabit.com/support/autorabit/ShowHomePage.do#Cases/dv/241415000069992262\",'+
		'    \"contactId\" : \"241415000038608210\",'+
		'    \"departmentId\" : \"241415000000006907\",'+
		'    \"accountId\" : \"241415000009524556\",'+
		'    \"closedTime\" : \"2022-02-22T14:49:10.000Z\",'+
		'    \"priority\" : \"P2\",'+
		'    \"createdTime\" : \"2022-02-11T16:58:31.000Z\",'+
		'    \"statusType\" : \"Closed\",'+
		'    \"status\" : \"Closed\",'+
		'    \"subject\" : \"BCBSM: Code Coverage Failure - DEV-INT\",'+
		'    \"ticketNumber\" : \"41420\",'+
		'    \"id\" : \"241415000069992262\"'+
		'  }, {'+
		'    \"webUrl\" : \"https://support.autorabit.com/support/autorabit/ShowHomePage.do#Cases/dv/241415000070006980\",'+
		'    \"contactId\" : \"241415000065054008\",'+
		'    \"departmentId\" : \"241415000000006907\",'+
		'    \"accountId\" : \"241415000064902193\",'+
		'    \"closedTime\" : \"2022-02-19T00:58:48.000Z\",'+
		'    \"priority\" : \"P1\",'+
		'    \"createdTime\" : \"2022-02-11T17:55:41.000Z\",'+
		'    \"statusType\" : \"Closed\",'+
		'    \"status\" : \"Closed\",'+
		'    \"subject\" : \"Deployment through Deployment module did not deploy all the component from Release Label\",'+
		'    \"ticketNumber\" : \"41421\",'+
		'    \"id\" : \"241415000070006980\"'+
		'  }, {'+
		'    \"webUrl\" : \"https://support.autorabit.com/support/autorabit/ShowHomePage.do#Cases/dv/241415000070003452\",'+
		'    \"contactId\" : \"241415000033215145\",'+
		'    \"departmentId\" : \"241415000000006907\",'+
		'    \"accountId\" : \"241415000000515257\",'+
		'    \"closedTime\" : \"2022-02-25T21:48:12.000Z\",'+
		'    \"priority\" : \"P1\",'+
		'    \"createdTime\" : \"2022-02-11T18:35:11.000Z\",'+
		'    \"statusType\" : \"Closed\",'+
		'    \"status\" : \"Closed\",'+
		'    \"subject\" : \"FCMA-nCino_utility for On-Prem instance.\",'+
		'    \"ticketNumber\" : \"41424\",'+
		'    \"id\" : \"241415000070003452\"'+
		'  }, {'+
		'    \"webUrl\" : \"https://support.autorabit.com/support/autorabit/ShowHomePage.do#Cases/dv/241415000070034047\",'+
		'    \"contactId\" : \"241415000060165493\",'+
		'    \"departmentId\" : \"241415000000006907\",'+
		'    \"accountId\" : \"241415000031282628\",'+
		'    \"closedTime\" : \"2022-02-19T00:43:06.000Z\",'+
		'    \"priority\" : \"P3\",'+
		'    \"createdTime\" : \"2022-02-11T20:16:23.000Z\",'+
		'    \"statusType\" : \"Closed\",'+
		'    \"status\" : \"Closed\",'+
		'    \"subject\" : \"Unable to retrieve the Salesforce Group Metadata from Salesforce Org through AutoRabit\",'+
		'    \"ticketNumber\" : \"41426\",'+
		'    \"id\" : \"241415000070034047\"'+
		'  }, {'+
		'    \"webUrl\" : \"https://support.autorabit.com/support/autorabit/ShowHomePage.do#Cases/dv/241415000069991634\",'+
		'    \"contactId\" : \"241415000045038348\",'+
		'    \"departmentId\" : \"241415000000006907\",'+
		'    \"accountId\" : \"241415000017159419\",'+
		'    \"closedTime\" : \"2022-03-03T01:50:03.000Z\",'+
		'    \"priority\" : \"P0\",'+
		'    \"createdTime\" : \"2022-02-12T01:30:05.000Z\",'+
		'    \"statusType\" : \"Closed\",'+
		'    \"status\" : \"Closed\",'+
		'    \"subject\" : \"Branching baseline jobs failing\",'+
		'    \"ticketNumber\" : \"41429\",'+
		'    \"id\" : \"241415000069991634\"'+
		'  }, {'+
		'    \"webUrl\" : \"https://support.autorabit.com/support/autorabit/ShowHomePage.do#Cases/dv/241415000070038741\",'+
		'    \"contactId\" : \"241415000021664497\",'+
		'    \"departmentId\" : \"241415000000006907\",'+
		'    \"accountId\" : \"241415000000391061\",'+
		'    \"closedTime\" : \"2022-02-15T10:52:59.000Z\",'+
		'    \"priority\" : \"P2\",'+
		'    \"createdTime\" : \"2022-02-12T10:25:42.000Z\",'+
		'    \"statusType\" : \"Closed\",'+
		'    \"status\" : \"Closed\",'+
		'    \"subject\" : \"EU3 instance down\",'+
		'    \"ticketNumber\" : \"41434\",'+
		'    \"id\" : \"241415000070038741\"'+
		'  }, {'+
		'    \"webUrl\" : \"https://support.autorabit.com/support/autorabit/ShowHomePage.do#Cases/dv/241415000070029305\",'+
		'    \"contactId\" : \"241415000022468247\",'+
		'    \"departmentId\" : \"241415000000006907\",'+
		'    \"accountId\" : \"241415000002339400\",'+
		'    \"closedTime\" : \"2022-02-17T19:52:22.000Z\",'+
		'    \"priority\" : \"P2\",'+
		'    \"createdTime\" : \"2022-02-13T18:08:42.000Z\",'+
		'    \"statusType\" : \"Closed\",'+
		'    \"status\" : \"Closed\",'+
		'    \"subject\" : \"Metadata for adding system admin profile\",'+
		'    \"ticketNumber\" : \"41443\",'+
		'    \"id\" : \"241415000070029305\"'+
		'  }, {'+
		'    \"webUrl\" : \"https://support.autorabit.com/support/autorabit/ShowHomePage.do#Cases/dv/241415000070028085\",'+
		'    \"contactId\" : \"241415000050114280\",'+
		'    \"departmentId\" : \"241415000000006907\",'+
		'    \"accountId\" : \"241415000033165930\",'+
		'    \"closedTime\" : \"2022-05-12T17:58:31.000Z\",'+
		'    \"priority\" : \"P1\",'+
		'    \"createdTime\" : \"2022-02-13T23:08:45.000Z\",'+
		'    \"statusType\" : \"Closed\",'+
		'    \"status\" : \"Closed\",'+
		'    \"subject\" : \"Failed deployment for nCino\",'+
		'    \"ticketNumber\" : \"41447\",'+
		'    \"id\" : \"241415000070028085\"'+
		'  }, {'+
		'    \"webUrl\" : \"https://support.autorabit.com/support/autorabit/ShowHomePage.do#Cases/dv/241415000070065001\",'+
		'    \"contactId\" : \"241415000060682008\",'+
		'    \"departmentId\" : \"241415000000006907\",'+
		'    \"accountId\" : \"241415000015857535\",'+
		'    \"closedTime\" : \"2022-03-07T11:43:37.000Z\",'+
		'    \"priority\" : \"P2\",'+
		'    \"createdTime\" : \"2022-02-14T04:38:57.000Z\",'+
		'    \"statusType\" : \"Closed\",'+
		'    \"status\" : \"Closed\",'+
		'    \"subject\" : \"Run Local Test : connection was cancelled here\",'+
		'    \"ticketNumber\" : \"41448\",'+
		'    \"id\" : \"241415000070065001\"'+
		'  }, {'+
		'    \"webUrl\" : \"https://support.autorabit.com/support/autorabit/ShowHomePage.do#Cases/dv/241415000070064002\",'+
		'    \"contactId\" : \"241415000066244064\",'+
		'    \"departmentId\" : \"241415000000006907\",'+
		'    \"accountId\" : \"241415000065622302\",'+
		'    \"closedTime\" : \"2022-05-24T10:38:13.000Z\",'+
		'    \"priority\" : \"P2\",'+
		'    \"createdTime\" : \"2022-02-14T05:57:13.000Z\",'+
		'    \"statusType\" : \"Closed\",'+
		'    \"status\" : \"Closed\",'+
		'    \"subject\" : \"AR Deployment module fails while CI Job alternative performs the deployment\",'+
		'    \"ticketNumber\" : \"41449\",'+
		'    \"id\" : \"241415000070064002\"'+
		'  }, {'+
		'    \"webUrl\" : \"https://support.autorabit.com/support/autorabit/ShowHomePage.do#Cases/dv/241415000070062179\",'+
		'    \"contactId\" : \"241415000066244064\",'+
		'    \"departmentId\" : \"241415000000006907\",'+
		'    \"accountId\" : \"241415000065622302\",'+
		'    \"closedTime\" : \"2022-02-25T04:45:02.000Z\",'+
		'    \"priority\" : \"P2\",'+
		'    \"createdTime\" : \"2022-02-14T07:29:24.000Z\",'+
		'    \"statusType\" : \"Closed\",'+
		'    \"status\" : \"Closed\",'+
		'    \"subject\" : \"Cannot switch to CLASS COVERAGE Tab in APEX Test Results\",'+
		'    \"ticketNumber\" : \"41455\",'+
		'    \"id\" : \"241415000070062179\"'+
		'  }, {'+
		'    \"webUrl\" : \"https://support.autorabit.com/support/autorabit/ShowHomePage.do#Cases/dv/241415000070069155\",'+
		'    \"contactId\" : \"241415000066244064\",'+
		'    \"departmentId\" : \"241415000000006907\",'+
		'    \"accountId\" : \"241415000065622302\",'+
		'    \"closedTime\" : \"2022-03-15T06:44:53.000Z\",'+
		'    \"priority\" : \"P2\",'+
		'    \"createdTime\" : \"2022-02-14T07:58:13.000Z\",'+
		'    \"statusType\" : \"Closed\",'+
		'    \"status\" : \"Closed\",'+
		'    \"subject\" : \"in Merge Request history _ Files changed _ path view makes the UI disappear\",'+
		'    \"ticketNumber\" : \"41456\",'+
		'    \"id\" : \"241415000070069155\"'+
		'  }, {'+
		'    \"webUrl\" : \"https://support.autorabit.com/support/autorabit/ShowHomePage.do#Cases/dv/241415000070064250\",'+
		'    \"contactId\" : \"241415000066244064\",'+
		'    \"departmentId\" : \"241415000000006907\",'+
		'    \"accountId\" : \"241415000065622302\",'+
		'    \"closedTime\" : \"2022-02-21T05:02:47.000Z\",'+
		'    \"priority\" : \"P2\",'+
		'    \"createdTime\" : \"2022-02-14T08:02:50.000Z\",'+
		'    \"statusType\" : \"Closed\",'+
		'    \"status\" : \"Closed\",'+
		'    \"subject\" : \"de-activated users in AutoRABIT make CI Job execution to be failed inmediatly\",'+
		'    \"ticketNumber\" : \"41457\",'+
		'    \"id\" : \"241415000070064250\"'+
		'  }, {'+
		'    \"webUrl\" : \"https://support.autorabit.com/support/autorabit/ShowHomePage.do#Cases/dv/241415000070065141\",'+
		'    \"contactId\" : \"241415000065354008\",'+
		'    \"departmentId\" : \"241415000000006907\",'+
		'    \"accountId\" : \"241415000026353670\",'+
		'    \"closedTime\" : \"2022-02-22T10:00:59.000Z\",'+
		'    \"priority\" : \"P0\",'+
		'    \"createdTime\" : \"2022-02-14T09:00:13.000Z\",'+
		'    \"statusType\" : \"Closed\",'+
		'    \"status\" : \"Closed\",'+
		'    \"subject\" : \"Unable to view the master branch in dropdown \",'+
		'    \"ticketNumber\" : \"41459\",'+
		'    \"id\" : \"241415000070065141\"'+
		'  }, {'+
		'    \"webUrl\" : \"https://support.autorabit.com/support/autorabit/ShowHomePage.do#Cases/dv/241415000070085001\",'+
		'    \"contactId\" : \"241415000024049008\",'+
		'    \"departmentId\" : \"241415000000006907\",'+
		'    \"accountId\" : \"241415000069998824\",'+
		'    \"closedTime\" : \"2022-02-14T17:18:59.000Z\",'+
		'    \"priority\" : \"P2\",'+
		'    \"createdTime\" : \"2022-02-14T09:20:24.000Z\",'+
		'    \"statusType\" : \"Closed\",'+
		'    \"status\" : \"Closed\",'+
		'    \"subject\" : \"Update Email-Id on my profile\",'+
		'    \"ticketNumber\" : \"41460\",'+
		'    \"id\" : \"241415000070085001\"'+
		'  }, {'+
		'    \"webUrl\" : \"https://support.autorabit.com/support/autorabit/ShowHomePage.do#Cases/dv/241415000070062376\",'+
		'    \"contactId\" : \"241415000069218008\",'+
		'    \"departmentId\" : \"241415000000006907\",'+
		'    \"accountId\" : \"241415000069230504\",'+
		'    \"closedTime\" : \"2022-02-18T02:45:38.000Z\",'+
		'    \"priority\" : \"P2\",'+
		'    \"createdTime\" : \"2022-02-14T12:27:20.000Z\",'+
		'    \"statusType\" : \"Closed\",'+
		'    \"status\" : \"Closed\",'+
		'    \"subject\" : \"CI Job Settings Changed to \\\"Validate ONLY\\\" can\'t unselect it now\",'+
		'    \"ticketNumber\" : \"41464\",'+
		'    \"id\" : \"241415000070062376\"'+
		'  }, {'+
		'    \"webUrl\" : \"https://support.autorabit.com/support/autorabit/ShowHomePage.do#Cases/dv/241415000070065323\",'+
		'    \"contactId\" : \"241415000038559214\",'+
		'    \"departmentId\" : \"241415000000006907\",'+
		'    \"accountId\" : \"241415000026558478\",'+
		'    \"closedTime\" : \"2022-02-14T12:54:59.000Z\",'+
		'    \"priority\" : \"P2\",'+
		'    \"createdTime\" : \"2022-02-14T12:30:21.000Z\",'+
		'    \"statusType\" : \"Closed\",'+
		'    \"status\" : \"Closed\",'+
		'    \"subject\" : \"IP Address update\",'+
		'    \"ticketNumber\" : \"41465\",'+
		'    \"id\" : \"241415000070065323\"'+
		'  }, {'+
		'    \"webUrl\" : \"https://support.autorabit.com/support/autorabit/ShowHomePage.do#Cases/dv/241415000070069430\",'+
		'    \"contactId\" : \"241415000064709601\",'+
		'    \"departmentId\" : \"241415000000006907\",'+
		'    \"accountId\" : \"241415000030005381\",'+
		'    \"closedTime\" : \"2022-02-21T13:47:13.000Z\",'+
		'    \"priority\" : \"P2\",'+
		'    \"createdTime\" : \"2022-02-14T14:38:19.000Z\",'+
		'    \"statusType\" : \"Closed\",'+
		'    \"status\" : \"Closed\",'+
		'    \"subject\" : \"Reverse Sync failing while Applying Merge. \",'+
		'    \"ticketNumber\" : \"41466\",'+
		'    \"id\" : \"241415000070069430\"'+
		'  }, {'+
		'    \"webUrl\" : \"https://support.autorabit.com/support/autorabit/ShowHomePage.do#Cases/dv/241415000070105001\",'+
		'    \"contactId\" : \"241415000038559214\",'+
		'    \"departmentId\" : \"241415000000006907\",'+
		'    \"accountId\" : \"241415000026558478\",'+
		'    \"closedTime\" : \"2022-02-14T18:50:12.000Z\",'+
		'    \"priority\" : \"P0\",'+
		'    \"createdTime\" : \"2022-02-14T15:42:22.000Z\",'+
		'    \"statusType\" : \"Closed\",'+
		'    \"status\" : \"Closed\",'+
		'    \"subject\" : \"IP Address update\",'+
		'    \"ticketNumber\" : \"41468\",'+
		'    \"id\" : \"241415000070105001\"'+
		'  }, {'+
		'    \"webUrl\" : \"https://support.autorabit.com/support/autorabit/ShowHomePage.do#Cases/dv/241415000070059781\",'+
		'    \"contactId\" : \"241415000069637263\",'+
		'    \"departmentId\" : \"241415000000006907\",'+
		'    \"accountId\" : \"241415000013590405\",'+
		'    \"closedTime\" : \"2022-02-15T00:44:41.000Z\",'+
		'    \"priority\" : \"P2\",'+
		'    \"createdTime\" : \"2022-02-14T17:10:13.000Z\",'+
		'    \"statusType\" : \"Closed\",'+
		'    \"status\" : \"Closed\",'+
		'    \"subject\" : \"Merge failed.\",'+
		'    \"ticketNumber\" : \"41470\",'+
		'    \"id\" : \"241415000070059781\"'+
		'  }, {'+
		'    \"webUrl\" : \"https://support.autorabit.com/support/autorabit/ShowHomePage.do#Cases/dv/241415000070107001\",'+
		'    \"contactId\" : \"241415000060428185\",'+
		'    \"departmentId\" : \"241415000000006907\",'+
		'    \"accountId\" : \"241415000000515257\",'+
		'    \"closedTime\" : \"2022-02-15T17:30:01.000Z\",'+
		'    \"priority\" : \"P1\",'+
		'    \"createdTime\" : \"2022-02-14T17:24:48.000Z\",'+
		'    \"statusType\" : \"Closed\",'+
		'    \"status\" : \"Closed\",'+
		'    \"subject\" : \"Issue with Org registration\",'+
		'    \"ticketNumber\" : \"41471\",'+
		'    \"id\" : \"241415000070107001\"'+
		'  }, {'+
		'    \"webUrl\" : \"https://support.autorabit.com/support/autorabit/ShowHomePage.do#Cases/dv/241415000070107143\",'+
		'    \"contactId\" : \"241415000064477047\",'+
		'    \"departmentId\" : \"241415000000006907\",'+
		'    \"accountId\" : \"241415000026558478\",'+
		'    \"closedTime\" : \"2022-02-14T19:12:52.000Z\",'+
		'    \"priority\" : \"P0\",'+
		'    \"createdTime\" : \"2022-02-14T17:28:05.000Z\",'+
		'    \"statusType\" : \"Closed\",'+
		'    \"status\" : \"Closed\",'+
		'    \"subject\" : \"Critical IP Address Update\",'+
		'    \"ticketNumber\" : \"41472\",'+
		'    \"id\" : \"241415000070107143\"'+
		'  }, {'+
		'    \"webUrl\" : \"https://support.autorabit.com/support/autorabit/ShowHomePage.do#Cases/dv/241415000070060697\",'+
		'    \"contactId\" : \"241415000054625077\",'+
		'    \"departmentId\" : \"241415000000006907\",'+
		'    \"accountId\" : \"241415000044120923\",'+
		'    \"closedTime\" : null,'+
		'    \"priority\" : \"P2\",'+
		'    \"createdTime\" : \"2022-02-14T18:29:14.000Z\",'+
		'    \"statusType\" : \"Open\",'+
		'    \"status\" : \"Waiting for User Updates\",'+
		'    \"subject\" : \"Critical : Issue - Release Label Creation - Missing Commit Label from List\",'+
		'    \"ticketNumber\" : \"41473\",'+
		'    \"id\" : \"241415000070060697\"'+
		'  }, {'+
		'    \"webUrl\" : \"https://support.autorabit.com/support/autorabit/ShowHomePage.do#Cases/dv/241415000070060816\",'+
		'    \"contactId\" : \"241415000065026338\",'+
		'    \"departmentId\" : \"241415000063557074\",'+
		'    \"accountId\" : \"241415000000515257\",'+
		'    \"closedTime\" : null,'+
		'    \"priority\" : null,'+
		'    \"createdTime\" : \"2022-02-14T18:40:20.000Z\",'+
		'    \"statusType\" : \"On Hold\",'+
		'    \"status\" : \"On Hold\",'+
		'    \"subject\" : \"HIGH PRIORITY - SRO Datadog Monitoring for Bad Java threads\",'+
		'    \"ticketNumber\" : \"41474\",'+
		'    \"id\" : \"241415000070060816\"'+
		'  }, {'+
		'    \"webUrl\" : \"https://support.autorabit.com/support/autorabit/ShowHomePage.do#Cases/dv/241415000070112003\",'+
		'    \"contactId\" : \"241415000000392174\",'+
		'    \"departmentId\" : \"241415000000006907\",'+
		'    \"accountId\" : \"241415000000391006\",'+
		'    \"closedTime\" : \"2022-02-17T01:55:05.000Z\",'+
		'    \"priority\" : \"P1\",'+
		'    \"createdTime\" : \"2022-02-14T19:51:32.000Z\",'+
		'    \"statusType\" : \"Closed\",'+
		'    \"status\" : \"Closed\",'+
		'    \"subject\" : \"CI Jobs Build Failin\",'+
		'    \"ticketNumber\" : \"41478\",'+
		'    \"id\" : \"241415000070112003\"'+
		'  }, {'+
		'    \"webUrl\" : \"https://support.autorabit.com/support/autorabit/ShowHomePage.do#Cases/dv/241415000070064819\",'+
		'    \"contactId\" : \"241415000065026338\",'+
		'    \"departmentId\" : \"241415000000006907\",'+
		'    \"accountId\" : \"241415000000515257\",'+
		'    \"closedTime\" : \"2022-02-15T00:44:22.000Z\",'+
		'    \"priority\" : \"P2\",'+
		'    \"createdTime\" : \"2022-02-14T22:03:28.000Z\",'+
		'    \"statusType\" : \"Closed\",'+
		'    \"status\" : \"Closed\",'+
		'    \"subject\" : \"Re: Aligntech VPN Tunnel down  \",'+
		'    \"ticketNumber\" : \"41480\",'+
		'    \"id\" : \"241415000070064819\"'+
		'  }, {'+
		'    \"webUrl\" : \"https://support.autorabit.com/support/autorabit/ShowHomePage.do#Cases/dv/241415000070114037\",'+
		'    \"contactId\" : \"241415000057650008\",'+
		'    \"departmentId\" : \"241415000000006907\",'+
		'    \"accountId\" : \"241415000048556728\",'+
		'    \"closedTime\" : \"2022-03-24T09:23:34.000Z\",'+
		'    \"priority\" : \"P2\",'+
		'    \"createdTime\" : \"2022-02-15T01:00:19.000Z\",'+
		'    \"statusType\" : \"Closed\",'+
		'    \"status\" : \"Closed\",'+
		'    \"subject\" : \"After migration of template we have unreadable characters in Destination sandbox\",'+
		'    \"ticketNumber\" : \"41484\",'+
		'    \"id\" : \"241415000070114037\"'+
		'  }, {'+
		'    \"webUrl\" : \"https://support.autorabit.com/support/autorabit/ShowHomePage.do#Cases/dv/241415000070063200\",'+
		'    \"contactId\" : \"241415000065026338\",'+
		'    \"departmentId\" : \"241415000063557074\",'+
		'    \"accountId\" : \"241415000000515257\",'+
		'    \"closedTime\" : \"2022-05-10T00:51:07.000Z\",'+
		'    \"priority\" : null,'+
		'    \"createdTime\" : \"2022-02-15T01:19:27.000Z\",'+
		'    \"statusType\" : \"Closed\",'+
		'    \"status\" : \"Closed\",'+
		'    \"subject\" : \"Re: INTERNAL - Moody\'s Increase Disk Space [##40876##] - APPROVAL NEEDED\",'+
		'    \"ticketNumber\" : \"41485\",'+
		'    \"id\" : \"241415000070063200\"'+
		'  }, {'+
		'    \"webUrl\" : \"https://support.autorabit.com/support/autorabit/ShowHomePage.do#Cases/dv/241415000070138069\",'+
		'    \"contactId\" : \"241415000053587744\",'+
		'    \"departmentId\" : \"241415000000006907\",'+
		'    \"accountId\" : \"241415000000515257\",'+
		'    \"closedTime\" : \"2022-02-16T10:12:06.000Z\",'+
		'    \"priority\" : \"P1\",'+
		'    \"createdTime\" : \"2022-02-15T06:56:44.000Z\",'+
		'    \"statusType\" : \"Closed\",'+
		'    \"status\" : \"Closed\",'+
		'    \"subject\" : \"FW: AutoRabit ARM - user subscription limit\",'+
		'    \"ticketNumber\" : \"41490\",'+
		'    \"id\" : \"241415000070138069\"'+
		'  }, {'+
		'    \"webUrl\" : \"https://support.autorabit.com/support/autorabit/ShowHomePage.do#Cases/dv/241415000070155001\",'+
		'    \"contactId\" : \"241415000065108160\",'+
		'    \"departmentId\" : \"241415000000006907\",'+
		'    \"accountId\" : \"241415000000391007\",'+
		'    \"closedTime\" : null,'+
		'    \"priority\" : \"P3\",'+
		'    \"createdTime\" : \"2022-02-15T07:29:42.000Z\",'+
		'    \"statusType\" : \"On Hold\",'+
		'    \"status\" : \"Feature Request\",'+
		'    \"subject\" : \"How to pass codecoverage from Autorabit to SonarQube tool\",'+
		'    \"ticketNumber\" : \"41491\",'+
		'    \"id\" : \"241415000070155001\"'+
		'  }, {'+
		'    \"webUrl\" : \"https://support.autorabit.com/support/autorabit/ShowHomePage.do#Cases/dv/241415000070159001\",'+
		'    \"contactId\" : \"241415000037714028\",'+
		'    \"departmentId\" : \"241415000063557074\",'+
		'    \"accountId\" : \"241415000034208534\",'+
		'    \"closedTime\" : \"2022-04-07T06:34:24.000Z\",'+
		'    \"priority\" : \"P1 - Critical\",'+
		'    \"createdTime\" : \"2022-02-15T08:49:43.000Z\",'+
		'    \"statusType\" : \"Closed\",'+
		'    \"status\" : \"Closed\",'+
		'    \"subject\" : \"Please share the list of nCino production instance and associated active customer details\",'+
		'    \"ticketNumber\" : \"41493\",'+
		'    \"id\" : \"241415000070159001\"'+
		'  }, {'+
		'    \"webUrl\" : \"https://support.autorabit.com/support/autorabit/ShowHomePage.do#Cases/dv/241415000070142103\",'+
		'    \"contactId\" : \"241415000022131008\",'+
		'    \"departmentId\" : \"241415000000006907\",'+
		'    \"accountId\" : \"241415000003632105\",'+
		'    \"closedTime\" : \"2022-02-23T10:33:15.000Z\",'+
		'    \"priority\" : \"P2\",'+
		'    \"createdTime\" : \"2022-02-15T10:04:12.000Z\",'+
		'    \"statusType\" : \"Closed\",'+
		'    \"status\" : \"Closed\",'+
		'    \"subject\" : \"List of branches from branch in AR\",'+
		'    \"ticketNumber\" : \"41495\",'+
		'    \"id\" : \"241415000070142103\"'+
		'  }, {'+
		'    \"webUrl\" : \"https://support.autorabit.com/support/autorabit/ShowHomePage.do#Cases/dv/241415000070170001\",'+
		'    \"contactId\" : \"241415000069637263\",'+
		'    \"departmentId\" : \"241415000000006907\",'+
		'    \"accountId\" : \"241415000013590405\",'+
		'    \"closedTime\" : \"2022-02-15T14:57:46.000Z\",'+
		'    \"priority\" : \"P2\",'+
		'    \"createdTime\" : \"2022-02-15T10:41:51.000Z\",'+
		'    \"statusType\" : \"Closed\",'+
		'    \"status\" : \"Closed\",'+
		'    \"subject\" : \"AutoRABIT is too slow\",'+
		'    \"ticketNumber\" : \"41496\",'+
		'    \"id\" : \"241415000070170001\"'+
		'  }, {'+
		'    \"webUrl\" : \"https://support.autorabit.com/support/autorabit/ShowHomePage.do#Cases/dv/241415000070184013\",'+
		'    \"contactId\" : \"241415000039535126\",'+
		'    \"departmentId\" : \"241415000000006907\",'+
		'    \"accountId\" : \"241415000050388441\",'+
		'    \"closedTime\" : \"2022-03-09T15:22:38.000Z\",'+
		'    \"priority\" : \"P2\",'+
		'    \"createdTime\" : \"2022-02-15T11:02:09.000Z\",'+
		'    \"statusType\" : \"Closed\",'+
		'    \"status\" : \"Closed\",'+
		'    \"subject\" : \"Multiple Commits are resulting into delta change while doing a validate deploy and failing.\",'+
		'    \"ticketNumber\" : \"41497\",'+
		'    \"id\" : \"241415000070184013\"'+
		'  }, {'+
		'    \"webUrl\" : \"https://support.autorabit.com/support/autorabit/ShowHomePage.do#Cases/dv/241415000070170324\",'+
		'    \"contactId\" : \"241415000070170298\",'+
		'    \"departmentId\" : \"241415000000006907\",'+
		'    \"accountId\" : \"241415000000391012\",'+
		'    \"closedTime\" : \"2022-02-15T14:25:45.000Z\",'+
		'    \"priority\" : \"P2\",'+
		'    \"createdTime\" : \"2022-02-15T11:47:07.000Z\",'+
		'    \"statusType\" : \"Closed\",'+
		'    \"status\" : \"Closed\",'+
		'    \"subject\" : \"Commits getting Failed\",'+
		'    \"ticketNumber\" : \"41499\",'+
		'    \"id\" : \"241415000070170324\"'+
		'  }, {'+
		'    \"webUrl\" : \"https://support.autorabit.com/support/autorabit/ShowHomePage.do#Cases/dv/241415000070170435\",'+
		'    \"contactId\" : \"241415000068376639\",'+
		'    \"departmentId\" : \"241415000000006907\",'+
		'    \"accountId\" : \"241415000068404250\",'+
		'    \"closedTime\" : \"2022-02-17T16:53:46.000Z\",'+
		'    \"priority\" : \"P2\",'+
		'    \"createdTime\" : \"2022-02-15T11:47:13.000Z\",'+
		'    \"statusType\" : \"Closed\",'+
		'    \"status\" : \"Closed\",'+
		'    \"subject\" : \"error on import of acccount and contacts\",'+
		'    \"ticketNumber\" : \"41500\",'+
		'    \"id\" : \"241415000070170435\"'+
		'  }, {'+
		'    \"webUrl\" : \"https://support.autorabit.com/support/autorabit/ShowHomePage.do#Cases/dv/241415000070178120\",'+
		'    \"contactId\" : \"241415000070178094\",'+
		'    \"departmentId\" : \"241415000000006907\",'+
		'    \"accountId\" : \"241415000013590405\",'+
		'    \"closedTime\" : \"2022-02-16T10:09:12.000Z\",'+
		'    \"priority\" : \"P2\",'+
		'    \"createdTime\" : \"2022-02-15T12:19:07.000Z\",'+
		'    \"statusType\" : \"Closed\",'+
		'    \"status\" : \"Closed\",'+
		'    \"subject\" : \"Merges Failing\",'+
		'    \"ticketNumber\" : \"41501\",'+
		'    \"id\" : \"241415000070178120\"'+
		'  }, {'+
		'    \"webUrl\" : \"https://support.autorabit.com/support/autorabit/ShowHomePage.do#Cases/dv/241415000070197002\",'+
		'    \"contactId\" : \"241415000068452008\",'+
		'    \"departmentId\" : \"241415000000006907\",'+
		'    \"accountId\" : \"241415000050388441\",'+
		'    \"closedTime\" : \"2022-02-16T09:52:22.000Z\",'+
		'    \"priority\" : \"P1\",'+
		'    \"createdTime\" : \"2022-02-15T13:49:29.000Z\",'+
		'    \"statusType\" : \"Closed\",'+
		'    \"status\" : \"Closed\",'+
		'    \"subject\" : \"Autorabit Currently Down/ Intermittent Lagging issues\",'+
		'    \"ticketNumber\" : \"41505\",'+
		'    \"id\" : \"241415000070197002\"'+
		'  }, {'+
		'    \"webUrl\" : \"https://support.autorabit.com/support/autorabit/ShowHomePage.do#Cases/dv/241415000070216001\",'+
		'    \"contactId\" : \"241415000066825542\",'+
		'    \"departmentId\" : \"241415000000006907\",'+
		'    \"accountId\" : \"241415000050388441\",'+
		'    \"closedTime\" : \"2022-02-16T15:52:11.000Z\",'+
		'    \"priority\" : \"P0\",'+
		'    \"createdTime\" : \"2022-02-15T14:17:52.000Z\",'+
		'    \"statusType\" : \"Closed\",'+
		'    \"status\" : \"Closed\",'+
		'    \"subject\" : \"Unable to move Destructive Changes through Autorabit\",'+
		'    \"ticketNumber\" : \"41507\",'+
		'    \"id\" : \"241415000070216001\"'+
		'  }, {'+
		'    \"webUrl\" : \"https://support.autorabit.com/support/autorabit/ShowHomePage.do#Cases/dv/241415000070229001\",'+
		'    \"contactId\" : \"241415000068979612\",'+
		'    \"departmentId\" : \"241415000000006907\",'+
		'    \"accountId\" : \"241415000023413363\",'+
		'    \"closedTime\" : \"2022-02-17T14:08:37.000Z\",'+
		'    \"priority\" : \"P2\",'+
		'    \"createdTime\" : \"2022-02-15T16:08:36.000Z\",'+
		'    \"statusType\" : \"Closed\",'+
		'    \"status\" : \"Closed\",'+
		'    \"subject\" : \"Unable to connect to SF environment\",'+
		'    \"ticketNumber\" : \"41509\",'+
		'    \"id\" : \"241415000070229001\"'+
		'  }, {'+
		'    \"webUrl\" : \"https://support.autorabit.com/support/autorabit/ShowHomePage.do#Cases/dv/241415000070231024\",'+
		'    \"contactId\" : \"241415000062618526\",'+
		'    \"departmentId\" : \"241415000000006907\",'+
		'    \"accountId\" : \"241415000061398146\",'+
		'    \"closedTime\" : \"2022-03-02T16:34:42.000Z\",'+
		'    \"priority\" : \"P2\",'+
		'    \"createdTime\" : \"2022-02-15T16:19:11.000Z\",'+
		'    \"statusType\" : \"Closed\",'+
		'    \"status\" : \"Closed\",'+
		'    \"subject\" : \"CTC CI Job Issue\",'+
		'    \"ticketNumber\" : \"41510\",'+
		'    \"id\" : \"241415000070231024\"'+
		'  }, {'+
		'    \"webUrl\" : \"https://support.autorabit.com/support/autorabit/ShowHomePage.do#Cases/dv/241415000070231137\",'+
		'    \"contactId\" : \"241415000060428185\",'+
		'    \"departmentId\" : \"241415000000006907\",'+
		'    \"accountId\" : \"241415000000515257\",'+
		'    \"closedTime\" : \"2022-02-17T09:35:27.000Z\",'+
		'    \"priority\" : \"P1\",'+
		'    \"createdTime\" : \"2022-02-15T16:23:02.000Z\",'+
		'    \"statusType\" : \"Closed\",'+
		'    \"status\" : \"Closed\",'+
		'    \"subject\" : \"Re: Ncino records import issue\",'+
		'    \"ticketNumber\" : \"41512\",'+
		'    \"id\" : \"241415000070231137\"'+
		'  }, {'+
		'    \"webUrl\" : \"https://support.autorabit.com/support/autorabit/ShowHomePage.do#Cases/dv/241415000070229397\",'+
		'    \"contactId\" : \"241415000054625077\",'+
		'    \"departmentId\" : \"241415000000006907\",'+
		'    \"accountId\" : \"241415000044120923\",'+
		'    \"closedTime\" : \"2022-02-17T02:10:43.000Z\",'+
		'    \"priority\" : \"P1\",'+
		'    \"createdTime\" : \"2022-02-15T17:39:00.000Z\",'+
		'    \"statusType\" : \"Closed\",'+
		'    \"status\" : \"Closed\",'+
		'    \"subject\" : \"Critical : Autorabit is not working.\",'+
		'    \"ticketNumber\" : \"41514\",'+
		'    \"id\" : \"241415000070229397\"'+
		'  }, {'+
		'    \"webUrl\" : \"https://support.autorabit.com/support/autorabit/ShowHomePage.do#Cases/dv/241415000070240001\",'+
		'    \"contactId\" : \"241415000069248108\",'+
		'    \"departmentId\" : \"241415000000006907\",'+
		'    \"accountId\" : \"241415000000391070\",'+
		'    \"closedTime\" : \"2022-02-15T23:14:29.000Z\",'+
		'    \"priority\" : \"P1\",'+
		'    \"createdTime\" : \"2022-02-15T18:15:27.000Z\",'+
		'    \"statusType\" : \"Closed\",'+
		'    \"status\" : \"Closed\",'+
		'    \"subject\" : \"Unable to log into AR after upgrade\",'+
		'    \"ticketNumber\" : \"41515\",'+
		'    \"id\" : \"241415000070240001\"'+
		'  }, {'+
		'    \"webUrl\" : \"https://support.autorabit.com/support/autorabit/ShowHomePage.do#Cases/dv/241415000070203219\",'+
		'    \"contactId\" : \"241415000064463008\",'+
		'    \"departmentId\" : \"241415000000006907\",'+
		'    \"accountId\" : \"241415000064902193\",'+
		'    \"closedTime\" : \"2022-02-15T23:08:44.000Z\",'+
		'    \"priority\" : \"P2\",'+
		'    \"createdTime\" : \"2022-02-15T18:34:35.000Z\",'+
		'    \"statusType\" : \"Closed\",'+
		'    \"status\" : \"Closed\",'+
		'    \"subject\" : \"Commits are Auto Rejecting\",'+
		'    \"ticketNumber\" : \"41516\",'+
		'    \"id\" : \"241415000070203219\"'+
		'  }, {'+
		'    \"webUrl\" : \"https://support.autorabit.com/support/autorabit/ShowHomePage.do#Cases/dv/241415000070203361\",'+
		'    \"contactId\" : \"241415000053160294\",'+
		'    \"departmentId\" : \"241415000000006907\",'+
		'    \"accountId\" : \"241415000023413363\",'+
		'    \"closedTime\" : \"2022-03-09T18:51:34.000Z\",'+
		'    \"priority\" : \"P2\",'+
		'    \"createdTime\" : \"2022-02-15T18:38:36.000Z\",'+
		'    \"statusType\" : \"Closed\",'+
		'    \"status\" : \"Closed\",'+
		'    \"subject\" : \"Some Standard Templates Used in a CI Job were using an Incorrect Filter Statement when Fetching Entry Object\",'+
		'    \"ticketNumber\" : \"41517\",'+
		'    \"id\" : \"241415000070203361\"'+
		'  }, {'+
		'    \"webUrl\" : \"https://support.autorabit.com/support/autorabit/ShowHomePage.do#Cases/dv/241415000070216459\",'+
		'    \"contactId\" : \"241415000069866018\",'+
		'    \"departmentId\" : \"241415000000006907\",'+
		'    \"accountId\" : \"241415000028925754\",'+
		'    \"closedTime\" : \"2022-02-15T22:02:14.000Z\",'+
		'    \"priority\" : \"P2\",'+
		'    \"createdTime\" : \"2022-02-15T19:57:58.000Z\",'+
		'    \"statusType\" : \"Closed\",'+
		'    \"status\" : \"Closed\",'+
		'    \"subject\" : \"AutoRabit failing to authenticate with Git for Deploy to production\",'+
		'    \"ticketNumber\" : \"41519\",'+
		'    \"id\" : \"241415000070216459\"'+
		'  }, {'+
		'    \"webUrl\" : \"https://support.autorabit.com/support/autorabit/ShowHomePage.do#Cases/dv/241415000070210094\",'+
		'    \"contactId\" : \"241415000065026338\",'+
		'    \"departmentId\" : \"241415000063557074\",'+
		'    \"accountId\" : \"241415000000515257\",'+
		'    \"closedTime\" : \"2022-03-31T08:43:40.000Z\",'+
		'    \"priority\" : null,'+
		'    \"createdTime\" : \"2022-02-15T20:23:30.000Z\",'+
		'    \"statusType\" : \"Closed\",'+
		'    \"status\" : \"Closed\",'+
		'    \"subject\" : \"Convert arm.autorabit.com instance to a Production instnance\",'+
		'    \"ticketNumber\" : \"41522\",'+
		'    \"id\" : \"241415000070210094\"'+
		'  }, {'+
		'    \"webUrl\" : \"https://support.autorabit.com/support/autorabit/ShowHomePage.do#Cases/dv/241415000070220041\",'+
		'    \"contactId\" : \"241415000061676008\",'+
		'    \"departmentId\" : \"241415000000006907\",'+
		'    \"accountId\" : \"241415000015857535\",'+
		'    \"closedTime\" : \"2022-02-15T23:15:07.000Z\",'+
		'    \"priority\" : \"P2\",'+
		'    \"createdTime\" : \"2022-02-15T21:50:43.000Z\",'+
		'    \"statusType\" : \"Closed\",'+
		'    \"status\" : \"Closed\",'+
		'    \"subject\" : \"Deployment Issue\",'+
		'    \"ticketNumber\" : \"41523\",'+
		'    \"id\" : \"241415000070220041\"'+
		'  }, {'+
		'    \"webUrl\" : \"https://support.autorabit.com/support/autorabit/ShowHomePage.do#Cases/dv/241415000070231590\",'+
		'    \"contactId\" : \"241415000070231564\",'+
		'    \"departmentId\" : \"241415000000006907\",'+
		'    \"accountId\" : \"241415000066508837\",'+
		'    \"closedTime\" : \"2022-02-18T20:31:53.000Z\",'+
		'    \"priority\" : \"P2\",'+
		'    \"createdTime\" : \"2022-02-15T22:11:41.000Z\",'+
		'    \"statusType\" : \"Closed\",'+
		'    \"status\" : \"Closed\",'+
		'    \"subject\" : \"Codescan Local License\",'+
		'    \"ticketNumber\" : \"41524\",'+
		'    \"id\" : \"241415000070231590\"'+
		'  }, {'+
		'    \"webUrl\" : \"https://support.autorabit.com/support/autorabit/ShowHomePage.do#Cases/dv/241415000070231700\",'+
		'    \"contactId\" : \"241415000027433331\",'+
		'    \"departmentId\" : \"241415000000006907\",'+
		'    \"accountId\" : \"241415000027326429\",'+
		'    \"closedTime\" : \"2022-03-05T00:12:55.000Z\",'+
		'    \"priority\" : \"P2\",'+
		'    \"createdTime\" : \"2022-02-15T23:58:22.000Z\",'+
		'    \"statusType\" : \"Closed\",'+
		'    \"status\" : \"Closed\",'+
		'    \"subject\" : \"Assistance with connecting ADO\",'+
		'    \"ticketNumber\" : \"41526\",'+
		'    \"id\" : \"241415000070231700\"'+
		'  }, {'+
		'    \"webUrl\" : \"https://support.autorabit.com/support/autorabit/ShowHomePage.do#Cases/dv/241415000070240139\",'+
		'    \"contactId\" : \"241415000069248108\",'+
		'    \"departmentId\" : \"241415000000006907\",'+
		'    \"accountId\" : \"241415000000391070\",'+
		'    \"closedTime\" : \"2022-02-18T20:37:50.000Z\",'+
		'    \"priority\" : \"P1\",'+
		'    \"createdTime\" : \"2022-02-16T00:33:51.000Z\",'+
		'    \"statusType\" : \"Closed\",'+
		'    \"status\" : \"Closed\",'+
		'    \"subject\" : \"Getting Flexipage error when deploying similar to our previous ticket\",'+
		'    \"ticketNumber\" : \"41527\",'+
		'    \"id\" : \"241415000070240139\"'+
		'  }, {'+
		'    \"webUrl\" : \"https://support.autorabit.com/support/autorabit/ShowHomePage.do#Cases/dv/241415000070221075\",'+
		'    \"contactId\" : \"241415000033215145\",'+
		'    \"departmentId\" : \"241415000000006907\",'+
		'    \"accountId\" : \"241415000000515257\",'+
		'    \"closedTime\" : \"2022-02-28T15:26:45.000Z\",'+
		'    \"priority\" : \"P2\",'+
		'    \"createdTime\" : \"2022-02-16T01:00:44.000Z\",'+
		'    \"statusType\" : \"Closed\",'+
		'    \"status\" : \"Closed\",'+
		'    \"subject\" : \"Exclude metadata types are not displaying properly after saving- UI Issue\",'+
		'    \"ticketNumber\" : \"41529\",'+
		'    \"id\" : \"241415000070221075\"'+
		'  }, {'+
		'    \"webUrl\" : \"https://support.autorabit.com/support/autorabit/ShowHomePage.do#Cases/dv/241415000070221221\",'+
		'    \"contactId\" : \"241415000033215145\",'+
		'    \"departmentId\" : \"241415000000006907\",'+
		'    \"accountId\" : \"241415000000515257\",'+
		'    \"closedTime\" : \"2022-03-08T10:55:43.000Z\",'+
		'    \"priority\" : \"P2\",'+
		'    \"createdTime\" : \"2022-02-16T01:20:37.000Z\",'+
		'    \"statusType\" : \"Closed\",'+
		'    \"status\" : \"Closed\",'+
		'    \"subject\" : \"Skip members feature is not working as expected. \",'+
		'    \"ticketNumber\" : \"41531\",'+
		'    \"id\" : \"241415000070221221\"'+
		'  }, {'+
		'    \"webUrl\" : \"https://support.autorabit.com/support/autorabit/ShowHomePage.do#Cases/dv/241415000070221369\",'+
		'    \"contactId\" : \"241415000033215145\",'+
		'    \"departmentId\" : \"241415000000006907\",'+
		'    \"accountId\" : \"241415000000515257\",'+
		'    \"closedTime\" : \"2022-02-25T01:43:19.000Z\",'+
		'    \"priority\" : \"P3\",'+
		'    \"createdTime\" : \"2022-02-16T01:55:43.000Z\",'+
		'    \"statusType\" : \"Closed\",'+
		'    \"status\" : \"Closed\",'+
		'    \"subject\" : \"Split revision Commit Label are not displaying in drop down during ez-commit.\",'+
		'    \"ticketNumber\" : \"41532\",'+
		'    \"id\" : \"241415000070221369\"'+
		'  }, {'+
		'    \"webUrl\" : \"https://support.autorabit.com/support/autorabit/ShowHomePage.do#Cases/dv/241415000070245061\",'+
		'    \"contactId\" : \"241415000050154427\",'+
		'    \"departmentId\" : \"241415000063557074\",'+
		'    \"accountId\" : \"241415000068364001\",'+
		'    \"closedTime\" : \"2022-03-30T18:25:03.000Z\",'+
		'    \"priority\" : null,'+
		'    \"createdTime\" : \"2022-02-16T02:33:40.000Z\",'+
		'    \"statusType\" : \"Closed\",'+
		'    \"status\" : \"Closed\",'+
		'    \"subject\" : \"Re: [## 40385 ##]  VPN details to be filled for First Republic Bank.\",'+
		'    \"ticketNumber\" : \"41534\",'+
		'    \"id\" : \"241415000070245061\"'+
		'  }, {'+
		'    \"webUrl\" : \"https://support.autorabit.com/support/autorabit/ShowHomePage.do#Cases/dv/241415000070220183\",'+
		'    \"contactId\" : \"241415000039535126\",'+
		'    \"departmentId\" : \"241415000000006907\",'+
		'    \"accountId\" : \"241415000050388441\",'+
		'    \"closedTime\" : \"2022-02-21T11:32:13.000Z\",'+
		'    \"priority\" : \"P3\",'+
		'    \"createdTime\" : \"2022-02-16T04:37:06.000Z\",'+
		'    \"statusType\" : \"Closed\",'+
		'    \"status\" : \"Closed\",'+
		'    \"subject\" : \"Can you make Gowsic ORG admin ?\",'+
		'    \"ticketNumber\" : \"41535\",'+
		'    \"id\" : \"241415000070220183\"'+
		'  }, {'+
		'    \"webUrl\" : \"https://support.autorabit.com/support/autorabit/ShowHomePage.do#Cases/dv/241415000070245258\",'+
		'    \"contactId\" : \"241415000066244064\",'+
		'    \"departmentId\" : \"241415000000006907\",'+
		'    \"accountId\" : \"241415000065622302\",'+
		'    \"closedTime\" : \"2022-02-25T01:37:53.000Z\",'+
		'    \"priority\" : \"P3\",'+
		'    \"createdTime\" : \"2022-02-16T05:49:50.000Z\",'+
		'    \"statusType\" : \"Closed\",'+
		'    \"status\" : \"Closed\",'+
		'    \"subject\" : \"low priority minor fix\",'+
		'    \"ticketNumber\" : \"41536\",'+
		'    \"id\" : \"241415000070245258\"'+
		'  }, {'+
		'    \"webUrl\" : \"https://support.autorabit.com/support/autorabit/ShowHomePage.do#Cases/dv/241415000070271137\",'+
		'    \"contactId\" : \"241415000063933030\",'+
		'    \"departmentId\" : \"241415000000006907\",'+
		'    \"accountId\" : \"241415000000391091\",'+
		'    \"closedTime\" : \"2022-02-24T15:11:51.000Z\",'+
		'    \"priority\" : \"P3\",'+
		'    \"createdTime\" : \"2022-02-16T06:36:51.000Z\",'+
		'    \"statusType\" : \"Closed\",'+
		'    \"status\" : \"Closed\",'+
		'    \"subject\" : \"Error Creating Commit - Validate Deployment Failed\",'+
		'    \"ticketNumber\" : \"41539\",'+
		'    \"id\" : \"241415000070271137\"'+
		'  }, {'+
		'    \"webUrl\" : \"https://support.autorabit.com/support/autorabit/ShowHomePage.do#Cases/dv/241415000070267044\",'+
		'    \"contactId\" : \"241415000070267018\",'+
		'    \"departmentId\" : \"241415000000006907\",'+
		'    \"accountId\" : \"241415000070325458\",'+
		'    \"closedTime\" : \"2022-02-17T04:21:01.000Z\",'+
		'    \"priority\" : \"P2\",'+
		'    \"createdTime\" : \"2022-02-16T06:54:32.000Z\",'+
		'    \"statusType\" : \"Closed\",'+
		'    \"status\" : \"Closed\",'+
		'    \"subject\" : \"Code Scan Account User Name - yashasvix.aggarwal@intel.com\",'+
		'    \"ticketNumber\" : \"41540\",'+
		'    \"id\" : \"241415000070267044\"'+
		'  }, {'+
		'    \"webUrl\" : \"https://support.autorabit.com/support/autorabit/ShowHomePage.do#Cases/dv/241415000070257002\",'+
		'    \"contactId\" : \"241415000044904832\",'+
		'    \"departmentId\" : \"241415000000006907\",'+
		'    \"accountId\" : \"241415000070264778\",'+
		'    \"closedTime\" : \"2022-03-15T08:50:07.000Z\",'+
		'    \"priority\" : \"P2\",'+
		'    \"createdTime\" : \"2022-02-16T07:20:02.000Z\",'+
		'    \"statusType\" : \"Closed\",'+
		'    \"status\" : \"Closed\",'+
		'    \"subject\" : \"AutoRabit: ServerManagerFactory error\",'+
		'    \"ticketNumber\" : \"41542\",'+
		'    \"id\" : \"241415000070257002\"'+
		'  }, {'+
		'    \"webUrl\" : \"https://support.autorabit.com/support/autorabit/ShowHomePage.do#Cases/dv/241415000070267165\",'+
		'    \"contactId\" : \"241415000069190008\",'+
		'    \"departmentId\" : \"241415000000006907\",'+
		'    \"accountId\" : \"241415000069160687\",'+
		'    \"closedTime\" : \"2022-02-22T08:57:45.000Z\",'+
		'    \"priority\" : \"P2\",'+
		'    \"createdTime\" : \"2022-02-16T07:28:31.000Z\",'+
		'    \"statusType\" : \"Closed\",'+
		'    \"status\" : \"Closed\",'+
		'    \"subject\" : \"Queries for Code Scan wrt Code Quality\",'+
		'    \"ticketNumber\" : \"41543\",'+
		'    \"id\" : \"241415000070267165\"'+
		'  }, {'+
		'    \"webUrl\" : \"https://support.autorabit.com/support/autorabit/ShowHomePage.do#Cases/dv/241415000070273309\",'+
		'    \"contactId\" : \"241415000052619348\",'+
		'    \"departmentId\" : \"241415000000006907\",'+
		'    \"accountId\" : \"241415000048000009\",'+
		'    \"closedTime\" : \"2022-03-01T09:10:27.000Z\",'+
		'    \"priority\" : \"P2\",'+
		'    \"createdTime\" : \"2022-02-16T08:14:44.000Z\",'+
		'    \"statusType\" : \"Closed\",'+
		'    \"status\" : \"Closed\",'+
		'    \"subject\" : \"Unable to Sync sandbox from Prod/Repository\",'+
		'    \"ticketNumber\" : \"41544\",'+
		'    \"id\" : \"241415000070273309\"'+
		'  }, {'+
		'    \"webUrl\" : \"https://support.autorabit.com/support/autorabit/ShowHomePage.do#Cases/dv/241415000070266159\",'+
		'    \"contactId\" : \"241415000021886192\",'+
		'    \"departmentId\" : \"241415000000006907\",'+
		'    \"accountId\" : \"241415000005134297\",'+
		'    \"closedTime\" : \"2022-02-16T14:43:48.000Z\",'+
		'    \"priority\" : \"P2\",'+
		'    \"createdTime\" : \"2022-02-16T09:17:49.000Z\",'+
		'    \"statusType\" : \"Closed\",'+
		'    \"status\" : \"Closed\",'+
		'    \"subject\" : \"Re: Autorabit weekend support on March 26/27 and April 2/3\",'+
		'    \"ticketNumber\" : \"41545\",'+
		'    \"id\" : \"241415000070266159\"'+
		'  }, {'+
		'    \"webUrl\" : \"https://support.autorabit.com/support/autorabit/ShowHomePage.do#Cases/dv/241415000070301001\",'+
		'    \"contactId\" : \"241415000066485346\",'+
		'    \"departmentId\" : \"241415000000006907\",'+
		'    \"accountId\" : \"241415000062449204\",'+
		'    \"closedTime\" : \"2022-03-03T14:26:18.000Z\",'+
		'    \"priority\" : \"P2\",'+
		'    \"createdTime\" : \"2022-02-16T09:48:44.000Z\",'+
		'    \"statusType\" : \"Closed\",'+
		'    \"status\" : \"Closed\",'+
		'    \"subject\" : \"Issues with deploying layouts\",'+
		'    \"ticketNumber\" : \"41546\",'+
		'    \"id\" : \"241415000070301001\"'+
		'  }, {'+
		'    \"webUrl\" : \"https://support.autorabit.com/support/autorabit/ShowHomePage.do#Cases/dv/241415000070302176\",'+
		'    \"contactId\" : \"241415000036548008\",'+
		'    \"departmentId\" : \"241415000000006907\",'+
		'    \"accountId\" : \"241415000000243015\",'+
		'    \"closedTime\" : \"2022-05-30T15:09:21.000Z\",'+
		'    \"priority\" : \"P3\",'+
		'    \"createdTime\" : \"2022-02-16T10:22:43.000Z\",'+
		'    \"statusType\" : \"Closed\",'+
		'    \"status\" : \"Closed\",'+
		'    \"subject\" : \"CI Job Deployment shows as Success on UI but there is no Deployment Report\",'+
		'    \"ticketNumber\" : \"41547\",'+
		'    \"id\" : \"241415000070302176\"'+
		'  }, {'+
		'    \"webUrl\" : \"https://support.autorabit.com/support/autorabit/ShowHomePage.do#Cases/dv/241415000070287086\",'+
		'    \"contactId\" : \"241415000070300303\",'+
		'    \"departmentId\" : \"241415000000006907\",'+
		'    \"accountId\" : \"241415000057111996\",'+
		'    \"closedTime\" : \"2022-04-18T23:32:33.000Z\",'+
		'    \"priority\" : \"P2\",'+
		'    \"createdTime\" : \"2022-02-16T12:16:39.000Z\",'+
		'    \"statusType\" : \"Closed\",'+
		'    \"status\" : \"Closed\",'+
		'    \"subject\" : \"FW: AutoRabit/Global Payments: Vault Update\",'+
		'    \"ticketNumber\" : \"41549\",'+
		'    \"id\" : \"241415000070287086\"'+
		'  }, {'+
		'    \"webUrl\" : \"https://support.autorabit.com/support/autorabit/ShowHomePage.do#Cases/dv/241415000070301139\",'+
		'    \"contactId\" : \"241415000066825542\",'+
		'    \"departmentId\" : \"241415000000006907\",'+
		'    \"accountId\" : \"241415000050388441\",'+
		'    \"closedTime\" : \"2022-02-16T15:51:06.000Z\",'+
		'    \"priority\" : \"P0\",'+
		'    \"createdTime\" : \"2022-02-16T12:26:42.000Z\",'+
		'    \"statusType\" : \"Closed\",'+
		'    \"status\" : \"Closed\",'+
		'    \"subject\" : \"CI Jobs are failing due to removal of admin access.\",'+
		'    \"ticketNumber\" : \"41550\",'+
		'    \"id\" : \"241415000070301139\"'+
		'  }, {'+
		'    \"webUrl\" : \"https://support.autorabit.com/support/autorabit/ShowHomePage.do#Cases/dv/241415000070323001\",'+
		'    \"contactId\" : \"241415000038559214\",'+
		'    \"departmentId\" : \"241415000000006907\",'+
		'    \"accountId\" : \"241415000026558478\",'+
		'    \"closedTime\" : \"2022-02-16T13:35:43.000Z\",'+
		'    \"priority\" : \"P2\",'+
		'    \"createdTime\" : \"2022-02-16T13:20:02.000Z\",'+
		'    \"statusType\" : \"Closed\",'+
		'    \"status\" : \"Closed\",'+
		'    \"subject\" : \"IP update\",'+
		'    \"ticketNumber\" : \"41551\",'+
		'    \"id\" : \"241415000070323001\"'+
		'  }, {'+
		'    \"webUrl\" : \"https://support.autorabit.com/support/autorabit/ShowHomePage.do#Cases/dv/241415000070326013\",'+
		'    \"contactId\" : \"241415000000456991\",'+
		'    \"departmentId\" : \"241415000000006907\",'+
		'    \"accountId\" : \"241415000000391086\",'+
		'    \"closedTime\" : \"2022-03-10T14:34:38.000Z\",'+
		'    \"priority\" : \"P1\",'+
		'    \"createdTime\" : \"2022-02-16T14:07:31.000Z\",'+
		'    \"statusType\" : \"Closed\",'+
		'    \"status\" : \"Closed\",'+
		'    \"subject\" : \"Strange behavior registering Azure Dev Ops ALM project + not working when trying to link an ez-merge to an Azure issue\",'+
		'    \"ticketNumber\" : \"41554\",'+
		'    \"id\" : \"241415000070326013\"'+
		'  }, {'+
		'    \"webUrl\" : \"https://support.autorabit.com/support/autorabit/ShowHomePage.do#Cases/dv/241415000070305176\",'+
		'    \"contactId\" : \"241415000032089008\",'+
		'    \"departmentId\" : \"241415000000006907\",'+
		'    \"accountId\" : \"241415000031798321\",'+
		'    \"closedTime\" : \"2022-02-16T18:03:27.000Z\",'+
		'    \"priority\" : \"P1\",'+
		'    \"createdTime\" : \"2022-02-16T14:33:52.000Z\",'+
		'    \"statusType\" : \"Closed\",'+
		'    \"status\" : \"Closed\",'+
		'    \"subject\" : \"S1 Urgent AutoRabit site appears to be down\",'+
		'    \"ticketNumber\" : \"41556\",'+
		'    \"id\" : \"241415000070305176\"'+
		'  }, {'+
		'    \"webUrl\" : \"https://support.autorabit.com/support/autorabit/ShowHomePage.do#Cases/dv/241415000070305302\",'+
		'    \"contactId\" : \"241415000065026338\",'+
		'    \"departmentId\" : \"241415000063557074\",'+
		'    \"accountId\" : \"241415000000515257\",'+
		'    \"closedTime\" : \"2022-03-29T01:01:44.000Z\",'+
		'    \"priority\" : null,'+
		'    \"createdTime\" : \"2022-02-16T16:09:37.000Z\",'+
		'    \"statusType\" : \"Closed\",'+
		'    \"status\" : \"Closed\",'+
		'    \"subject\" : \"Re: Approval request for read only access to server logs\",'+
		'    \"ticketNumber\" : \"41557\",'+
		'    \"id\" : \"241415000070305302\"'+
		'  }, {'+
		'    \"webUrl\" : \"https://support.autorabit.com/support/autorabit/ShowHomePage.do#Cases/dv/241415000070301281\",'+
		'    \"contactId\" : \"241415000066825542\",'+
		'    \"departmentId\" : \"241415000000006907\",'+
		'    \"accountId\" : \"241415000050388441\",'+
		'    \"closedTime\" : \"2022-02-18T19:39:42.000Z\",'+
		'    \"priority\" : \"P2\",'+
		'    \"createdTime\" : \"2022-02-16T18:21:19.000Z\",'+
		'    \"statusType\" : \"Closed\",'+
		'    \"status\" : \"Closed\",'+
		'    \"subject\" : \"CI Job was not running automatically for Sandboxes.\",'+
		'    \"ticketNumber\" : \"41560\",'+
		'    \"id\" : \"241415000070301281\"'+
		'  }, {'+
		'    \"webUrl\" : \"https://support.autorabit.com/support/autorabit/ShowHomePage.do#Cases/dv/241415000070326169\",'+
		'    \"contactId\" : \"241415000069684008\",'+
		'    \"departmentId\" : \"241415000000006907\",'+
		'    \"accountId\" : \"241415000062891453\",'+
		'    \"closedTime\" : \"2022-05-13T01:17:48.000Z\",'+
		'    \"priority\" : \"P2\",'+
		'    \"createdTime\" : \"2022-02-16T18:35:14.000Z\",'+
		'    \"statusType\" : \"Closed\",'+
		'    \"status\" : \"Closed\",'+
		'    \"subject\" : \"Spreads Feature Deployment pulling in too many records resulting in deployment/commit failures\",'+
		'    \"ticketNumber\" : \"41561\",'+
		'    \"id\" : \"241415000070326169\"'+
		'  }, {'+
		'    \"webUrl\" : \"https://support.autorabit.com/support/autorabit/ShowHomePage.do#Cases/dv/241415000070309469\",'+
		'    \"contactId\" : \"241415000065026338\",'+
		'    \"departmentId\" : \"241415000063557074\",'+
		'    \"accountId\" : \"241415000000515257\",'+
		'    \"closedTime\" : \"2022-03-13T01:37:39.000Z\",'+
		'    \"priority\" : null,'+
		'    \"createdTime\" : \"2022-02-16T20:48:18.000Z\",'+
		'    \"statusType\" : \"Closed\",'+
		'    \"status\" : \"Closed\",'+
		'    \"subject\" : \"Fw: Delete Dedicated Churned Instance Customers\",'+
		'    \"ticketNumber\" : \"41564\",'+
		'    \"id\" : \"241415000070309469\"'+
		'  }, {'+
		'    \"webUrl\" : \"https://support.autorabit.com/support/autorabit/ShowHomePage.do#Cases/dv/241415000070301431\",'+
		'    \"contactId\" : \"241415000021350244\",'+
		'    \"departmentId\" : \"241415000000006907\",'+
		'    \"accountId\" : \"241415000023413363\",'+
		'    \"closedTime\" : \"2022-02-25T01:21:53.000Z\",'+
		'    \"priority\" : \"P3\",'+
		'    \"createdTime\" : \"2022-02-16T21:34:56.000Z\",'+
		'    \"statusType\" : \"Closed\",'+
		'    \"status\" : \"Closed\",'+
		'    \"subject\" : \"nCino Feature Deployment Filter Does Not Work\",'+
		'    \"ticketNumber\" : \"41566\",'+
		'    \"id\" : \"241415000070301431\"'+
		'  }, {'+
		'    \"webUrl\" : \"https://support.autorabit.com/support/autorabit/ShowHomePage.do#Cases/dv/241415000070287500\",'+
		'    \"contactId\" : \"241415000066244064\",'+
		'    \"departmentId\" : \"241415000000006907\",'+
		'    \"accountId\" : \"241415000065622302\",'+
		'    \"closedTime\" : \"2022-03-15T05:28:04.000Z\",'+
		'    \"priority\" : \"P2\",'+
		'    \"createdTime\" : \"2022-02-16T21:37:03.000Z\",'+
		'    \"statusType\" : \"Closed\",'+
		'    \"status\" : \"Closed\",'+
		'    \"subject\" : \"Code coverage report failure for DEV and SIT-UAT\",'+
		'    \"ticketNumber\" : \"41567\",'+
		'    \"id\" : \"241415000070287500\"'+
		'  }, {'+
		'    \"webUrl\" : \"https://support.autorabit.com/support/autorabit/ShowHomePage.do#Cases/dv/241415000070305700\",'+
		'    \"contactId\" : \"241415000071243756\",'+
		'    \"departmentId\" : \"241415000000006907\",'+
		'    \"accountId\" : \"241415000071243802\",'+
		'    \"closedTime\" : null,'+
		'    \"priority\" : \"P2\",'+
		'    \"createdTime\" : \"2022-02-17T03:05:31.000Z\",'+
		'    \"statusType\" : \"Open\",'+
		'    \"status\" : \"Waiting for Engineering\",'+
		'    \"subject\" : \"Re: Codescan Binding issue \",'+
		'    \"ticketNumber\" : \"41569\",'+
		'    \"id\" : \"241415000070305700\"'+
		'  }, {'+
		'    \"webUrl\" : \"https://support.autorabit.com/support/autorabit/ShowHomePage.do#Cases/dv/241415000070326325\",'+
		'    \"contactId\" : \"241415000069414152\",'+
		'    \"departmentId\" : \"241415000000006907\",'+
		'    \"accountId\" : \"241415000069414242\",'+
		'    \"closedTime\" : \"2022-02-22T02:00:27.000Z\",'+
		'    \"priority\" : \"P3\",'+
		'    \"createdTime\" : \"2022-02-17T03:36:37.000Z\",'+
		'    \"statusType\" : \"Closed\",'+
		'    \"status\" : \"Closed\",'+
		'    \"subject\" : \"Remove super admin user and add a new one\",'+
		'    \"ticketNumber\" : \"41570\",'+
		'    \"id\" : \"241415000070326325\"'+
		'  }, {'+
		'    \"webUrl\" : \"https://support.autorabit.com/support/autorabit/ShowHomePage.do#Cases/dv/241415000070309662\",'+
		'    \"contactId\" : \"241415000035880001\",'+
		'    \"departmentId\" : \"241415000000006907\",'+
		'    \"accountId\" : \"241415000066531002\",'+
		'    \"closedTime\" : \"2022-02-23T05:35:31.000Z\",'+
		'    \"priority\" : \"P2\",'+
		'    \"createdTime\" : \"2022-02-17T05:30:06.000Z\",'+
		'    \"statusType\" : \"Closed\",'+
		'    \"status\" : \"Closed\",'+
		'    \"subject\" : \"Fw: Request for AutoRabit license file\",'+
		'    \"ticketNumber\" : \"41573\",'+
		'    \"id\" : \"241415000070309662\"'+
		'  }, {'+
		'    \"webUrl\" : \"https://support.autorabit.com/support/autorabit/ShowHomePage.do#Cases/dv/241415000070301715\",'+
		'    \"contactId\" : \"241415000050025001\",'+
		'    \"departmentId\" : \"241415000063557074\",'+
		'    \"accountId\" : null,'+
		'    \"closedTime\" : \"2022-04-07T06:33:20.000Z\",'+
		'    \"priority\" : \"P2 - Obstacle\",'+
		'    \"createdTime\" : \"2022-02-17T05:30:46.000Z\",'+
		'    \"statusType\" : \"Closed\",'+
		'    \"status\" : \"Closed\",'+
		'    \"subject\" : \"Automated Build Job for Template Migration Portal\",'+
		'    \"ticketNumber\" : \"41574\",'+
		'    \"id\" : \"241415000070301715\"'+
		'  }, {'+
		'    \"webUrl\" : \"https://support.autorabit.com/support/autorabit/ShowHomePage.do#Cases/dv/241415000070323279\",'+
		'    \"contactId\" : \"241415000054982008\",'+
		'    \"departmentId\" : \"241415000000006907\",'+
		'    \"accountId\" : \"241415000054190632\",'+
		'    \"closedTime\" : \"2022-02-17T10:55:42.000Z\",'+
		'    \"priority\" : \"P2\",'+
		'    \"createdTime\" : \"2022-02-17T05:59:42.000Z\",'+
		'    \"statusType\" : \"Closed\",'+
		'    \"status\" : \"Closed\",'+
		'    \"subject\" : \"Pipeline doesn\'t work\",'+
		'    \"ticketNumber\" : \"41575\",'+
		'    \"id\" : \"241415000070323279\"'+
		'  }, {'+
		'    \"webUrl\" : \"https://support.autorabit.com/support/autorabit/ShowHomePage.do#Cases/dv/241415000070344005\",'+
		'    \"contactId\" : \"241415000053927071\",'+
		'    \"departmentId\" : \"241415000000006907\",'+
		'    \"accountId\" : \"241415000054190632\",'+
		'    \"closedTime\" : \"2022-02-18T06:12:40.000Z\",'+
		'    \"priority\" : \"P1\",'+
		'    \"createdTime\" : \"2022-02-17T06:53:44.000Z\",'+
		'    \"statusType\" : \"Closed\",'+
		'    \"status\" : \"Closed\",'+
		'    \"subject\" : \"Unable to register branch\",'+
		'    \"ticketNumber\" : \"41578\",'+
		'    \"id\" : \"241415000070344005\"'+
		'  }, {'+
		'    \"webUrl\" : \"https://support.autorabit.com/support/autorabit/ShowHomePage.do#Cases/dv/241415000070355003\",'+
		'    \"contactId\" : \"241415000004884017\",'+
		'    \"departmentId\" : \"241415000063557074\",'+
		'    \"accountId\" : null,'+
		'    \"closedTime\" : \"2022-04-01T20:50:12.000Z\",'+
		'    \"priority\" : \"P1 - Critical\",'+
		'    \"createdTime\" : \"2022-02-17T07:22:05.000Z\",'+
		'    \"statusType\" : \"Closed\",'+
		'    \"status\" : \"Closed\",'+
		'    \"subject\" : \"Getting insufficient privileges while logging to codescan \",'+
		'    \"ticketNumber\" : \"41580\",'+
		'    \"id\" : \"241415000070355003\"'+
		'  }, {'+
		'    \"webUrl\" : \"https://support.autorabit.com/support/autorabit/ShowHomePage.do#Cases/dv/241415000070365001\",'+
		'    \"contactId\" : \"241415000065925002\",'+
		'    \"departmentId\" : \"241415000000006907\",'+
		'    \"accountId\" : \"241415000063482450\",'+
		'    \"closedTime\" : \"2022-02-18T04:07:57.000Z\",'+
		'    \"priority\" : \"P2\",'+
		'    \"createdTime\" : \"2022-02-17T08:51:17.000Z\",'+
		'    \"statusType\" : \"Closed\",'+
		'    \"status\" : \"Closed\",'+
		'    \"subject\" : \"Metadata ZIP Upload Returns Error\",'+
		'    \"ticketNumber\" : \"41581\",'+
		'    \"id\" : \"241415000070365001\"'+
		'  } ]'+
		'}';
		ZohoTicketJSON2Apex obj = ZohoTicketJSON2Apex.parse(json);
		System.assert(obj != null);
	}
}