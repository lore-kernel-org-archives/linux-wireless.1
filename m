Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=192.198.163.19
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794395082;
	b=3f++vieCMPbzEokbDGjwYVEbBuk5wtwPWCSJsRZ2UaSNUuhIUrOUQuGMVGdQLULNhi6g
	 bqx/NAE2UniGjgCg9ZEa4gLEhHhB+E1n3YVCs5yM/LfzVtHVdGTpiJxsi8Ud9jo2tQaNY
	 UFS7vD3d7Ja9uac3lCIZAXA83qOwXu/7GQZ3+VGbLarsZWhGVSWIvgEYzD7sbOMlDFs4a
	 uqDFyU9Kx76/yNZFCm1F7HJ70X2OnM+l7hiSbq7fQ5+pHWExrm7vU9iwmeQfQyL6oWfhP
	 fUrRNT35S5AtxRqPulACgHPnp1XIdzw1SVpmDosT5piNrf4PiyoNHGy8Tr1PxAFd5YA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794395082;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Received:Received:Received:From:To:CC:Subject:Thread-Topic:
	 Thread-Index:Date:Message-ID:References:In-Reply-To:Accept-Language:
	 Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:x-ms-exchange-senderadcheck:
	 x-ms-exchange-antispam-relay:x-microsoft-antispam:
	 x-microsoft-antispam-message-info:x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:
	 X-Exchange-RoutingPolicyChecked:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
	 X-MS-Exchange-CrossTenant-userprincipalname:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-OriginatorOrg;
	bh=bJtCmACRLpT+8X4mop5Dkd9e0uL4MWhh6HzbTQH5tP8=;
	b=WNp5dCr84ynvCYbnnnc8jBVWoEfzd+TY5Xog9ZTXJLdoNVYB511FTO6nI0QlJUWnjiEe
	 OMwMphPEqwJ6LYVumd6UatUmi+DSn452DBdXNo3l/Zm6jgyJZe4o87z/BtYk/8u1Bx9mZ
	 YSdNcTRKXUzZCk0mKILUdaFRuC8QsDIVTBeJ8qWzFrvi+aYq8WRWXPmGDhjFAqSnU/WDf
	 Yupfb85WOV/7pcC+fzb/fAO9byzhjN3cP4SsPOqb1vVefD/dpGp+9j7B7SFGbL/HcITCP
	 Ek4DpUGfyrdJ6sGh6G+02dwHKBqOgkOHzimV3w1ezv57L1GK4d8rNLLORUXMR13lVSA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PxREIn3w;
	arc=pass header.oldest-pass=0 smtp.remote-ip=192.198.163.19
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 207F2606A31C
	for <linux-wireless@vger.kernel.org>; Wed, 11 Nov 2026 11:04:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 207F2606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PxREIn3w
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794395083; x=1825931083;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=bJtCmACRLpT+8X4mop5Dkd9e0uL4MWhh6HzbTQH5tP8=;
  b=PxREIn3wQcnhXQpOXHyjpfD4Qasjtdpnx38KmFXM4DW0LZ0AKNKWO9RC
   imG3Zm85mt9pJMBdXZkUqUrbQyjDVfu3O9zTP73PtBzaORvddRub99DGI
   Mns9E0WCDWylMPaYAe0CnEuAHAyfEXcIoOIS0RZR4hI5mTraKmn1vZP4V
   RoOrvcClDGCbL/iSAlLyCiQUj+4hF+LnXMszgTFiHtW+LR0SaeD+2Izxn
   8lIrmnO9EKe2E/0H8xHRQ3GuA3rV9jnuRFWANW6xTK4Zq5sTJCid8TL7a
   1bREbCeUCcg3BG/X4rYBQ6Uf/mcFD63dFapdnMWluTY5OLCtB+zLHBZ7z
   w==;
X-CSE-ConnectionGUID: VweBEP9JQy6XKdf+nltncQ==
X-CSE-MsgGUID: hx2v5KNzTMqvMopQ5WP9zg==
X-IronPort-AV: E=McAfee;i="6800,10657,11962"; a="3262437"
X-IronPort-AV: E=Sophos;i="6.27,207,1787036400"; 
   d="scan'208";a="3262437"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2026 03:04:42 -0800
X-CSE-ConnectionGUID: jZab87VvTaW1judp99+C+A==
X-CSE-MsgGUID: XSWD4TqFSWWSucFbUeXCZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,207,1787036400"; 
   d="scan'208";a="8709093"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2026 03:04:41 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 11 Nov 2026 03:04:40 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Wed, 11 Nov 2026 03:04:40 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.49) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 11 Nov 2026 03:04:40 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AQQGVFBlLDEYR7cL9YxiJtWnHwgENPuxAB17+HP3/+eEPvbxOb8f29tskdrVgEnqlGtxnDZC387zk6f6zC2GUD2Cx2mtAmjnh5gX4koqP/+eEb59z8XFbyg3VLQs0m+YTeRULrceHDODb+IFW07OZ6iRmaU0jI1WLYnGsIWrPmUpsUC+b5m//pG1CUSdzWIPIbQeKOz/84nAjLh1zizmyykx9x4PEjKSiYRl5CTue5xnW0DxKXvUnKYhHHvGdNcEhbkUoLLgWRRDk/GRQ2izY70nW29CLu/80v2NQtizQk/qSSyjXoVf6m+ppmHOqFjjnn/JOv8aAarfOqctuC5Lqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bJtCmACRLpT+8X4mop5Dkd9e0uL4MWhh6HzbTQH5tP8=;
 b=YLCFM1Bng3Z8J5snpQZ0Pcurhl+nfZs7QIywna0kGz/w0SQOTGBrFTiFCu+8ZDOmYzdJIPMOt8NboUwXPJPB+gGBy+twgTNowhsO0gbvGsE36pkS/W+GN8iGIOQz7r1dCZnfTdvPKqzCjhXHmPHkTKybbsIorlsmuluqE0UOirvTK8EFWvIv+GWjqGrLuzk3USzKE16MVcf9b8S7K7M40UYq7WgS0I+pcU4Ht06W1IpgTF1dNEnXjLhmKupIzkfhQ04kp4YugjgQAHMjMWnqighy1Aaak4qoUBbR93grmv5CfySdCgVAWPND1q9p6mJZTe/mJaj7Q2WS/WSuWCRUiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6252.namprd11.prod.outlook.com (2603:10b6:a03:457::21)
 by CH3PR11MB089109.namprd11.prod.outlook.com (2603:10b6:610:361::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.9; Wed, 11 Nov
 2026 11:04:38 +0000
Received: from SJ1PR11MB6252.namprd11.prod.outlook.com
 ([fe80::7d3e:3000:9690:1570]) by SJ1PR11MB6252.namprd11.prod.outlook.com
 ([fe80::7d3e:3000:9690:1570%6]) with mapi id 15.21.0615.007; Wed, 11 Nov 2026
 11:04:37 +0000
From: "Otcheretianski, Andrei" <andrei.otcheretianski@intel.com>
To: Shivani Baranwal <shivani.baranwal@oss.qualcomm.com>,
	"johannes@sipsolutions.net" <johannes@sipsolutions.net>
CC: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
	"kavita.kavita@oss.qualcomm.com" <kavita.kavita@oss.qualcomm.com>,
	"vamsin@qti.qualcomm.com" <vamsin@qti.qualcomm.com>
Subject: RE: [PATCH wireless-next v2 09/19] wifi: nl80211: add NDP offload
 capability advertisement
Thread-Topic: [PATCH wireless-next v2 09/19] wifi: nl80211: add NDP offload
 capability advertisement
Thread-Index: AQHdcM1g4dP7xWNqN0m4fK2CWHfdzbcotvFA
Date: Wed, 11 Nov 2026 11:04:37 +0000
Message-ID: <SJ1PR11MB6252FD85B8684ABA10260647F5712@SJ1PR11MB6252.namprd11.prod.outlook.com>
References: <20261110043242.2012238-1-shivani.baranwal@oss.qualcomm.com>
 <20261110043242.2012238-10-shivani.baranwal@oss.qualcomm.com>
In-Reply-To: <20261110043242.2012238-10-shivani.baranwal@oss.qualcomm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6252:EE_|CH3PR11MB089109:EE_
x-ms-office365-filtering-correlation-id: 62aeb925-1948-484e-f4a0-08df3fe39397
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|38070700021|10067099003|11063799006|4143699003|56012099006|261026121527099003|261009223027099003|18002099003|22082099003;
x-microsoft-antispam-message-info: xLHFVqzbSqRbp1OysYWrq21YnCRyIswORH2XfdZU+/ibHB+6uzJr7mJPZ5A6e+e7iOX0IwjBuXX6gquDWb7+5ZWdmAxKaKm/uQJY32ckF4BFoIqJ/Ah4CEnu1c9fQzEacknH5zo4iYSelNQsdg/2QlipGTbtt36LFS1F2s/wYqzKtHUvazE2s5/tsXJl7SwDaz5H7/e/fOcvcT8xu2okQKZQY/a9BZFQiFUvDN8UR9uP1GgSp4IvjItR1O2vR60ONWt/4IL/eVkyal12zrskzORRn/nbD75GOJRoQFrqOLX+li4nqpaw+4qaAxVzBbAxM6VdouxE7pz0gOgwl7tdDGVdR3EWiy7izhftehJ8T5lPL/EIu8xQK2wJ4fzqPYudcr4OozfDbUTcYuzB7uipJUjvsS3NV7nvADPtinb7M3y871UkJJaWobL90nQoNwJUxpbndhNpK37koYwLOUtHwBLmBsdyyf9rK5g4S9o0xzMMO0RLF3zS1vhwePM1rbCNUojNJJLPMy5zuNifBe0WQrqjTPH8+0KZZfZriehhWLzV6+UuslIshE3Y9rSaZ5pM/zLuGfvjo76J2jnwW+ZExHrWOSNGyn+YBx6xlJT0GPKeMkNTLaWBBIvBmYgQx6p/m72hCDTnuFKSjT1Wi7uzP0RKFG03e4SXKNI94iwGbLcxeNz9BCKL2JeXzT09RvTY+QniFuu9qvzaMCZZL/F4RlrT98Ki9nlfsBkBlIv4A/k=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR11MB6252.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(38070700021)(10067099003)(11063799006)(4143699003)(56012099006)(261026121527099003)(261009223027099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?L2FEaGpuOXk3QndacjlJYWt2QmNVRWF5dWoyZUIvbXBnWEE0RFlyb0N2QzA0?=
 =?utf-8?B?ZEFGRUpZOVZsZm95cUM1eTg2UFdTMm5STWxXYW5iNE1DNXdSS0Z5b1FTK0Fo?=
 =?utf-8?B?bmloNmEyOHRYZkZCNFZwWmxsSm4rZnJLN2NubVRkbTRZend4U3lwOWF1dStH?=
 =?utf-8?B?TEw0QUVzVzRCMU8rRjJGQmdiT2E3dXNxK3ZrVTRNdUpLd2p6UVBKK1JwYWgx?=
 =?utf-8?B?UlVkOG0xVWwvZmtIQlBxUHE3cEdocUhha09wK1BMMkNDTTlyNE9LckNJQTNG?=
 =?utf-8?B?MG9aSUlvK2luVlhPS0hRdDlvWjRlV2FoOUZiSXlYaXU5Y09vRnB5NzBZQWJr?=
 =?utf-8?B?QzF3dis4aHpnK1JqQWU0dkF0MUVidmIvb0VFMDhzcEtqdnBLcU1FUjJtaGll?=
 =?utf-8?B?bllWak0wUVUwZy9nYU1hMnFxbUQ4YTVITHBGSmR3WWtrdFJrZ2x6NVI4Y2xD?=
 =?utf-8?B?aEl5ek1KNEh0QjJCT0QrektKdDVQOGxPdVNOK01kc2ZVR0duQ3B4UnJUdUNX?=
 =?utf-8?B?Zk5iNGEydVYzVUhMeU9idmZ5a3VTK3U5ZFc3RUZGMVBia25TL0JqczFSK1RI?=
 =?utf-8?B?c2FqOTJ1OXppS0tWeEFieWFrQmtoUjNoSzNoN201RDJzZjRWN1pnbk83U205?=
 =?utf-8?B?WmhOUXpyeDVuRmtWdERwc00wcGxwYWs4bm44NDBsOE9vRExVY213L3p6WGlu?=
 =?utf-8?B?NWl3MGx6SThVUitheGlQREw3elp0bmk3RTRqeGZWckJuczB0SGp0V3VvOGdL?=
 =?utf-8?B?WVNUNVYzamJidk41Tm9aZVJKSVhUM0JmTjJKMVJPSms4WndjaFE4dkF2cTVk?=
 =?utf-8?B?aWNCUFBQQTVxMkJIOTNscnRCakp5dXpRTjBUR0grVDlpVUM3M29LMlVncFFi?=
 =?utf-8?B?N0JtazR0R1QySDBOZ2ExSTJTSXkyZFFyS29tRkJhYXFLa25va25KUG5pOFIz?=
 =?utf-8?B?cndrQWs4TG9tNFg2SENrOUhVRUJJQ25KaDROWE9WQytGdm5zTG9MdEN2OTNq?=
 =?utf-8?B?ankvRmZtN0FFbVY4TUJYc3J2RlppSkUrWnhMOEphK3R1NXZ6enlkamdjV3c0?=
 =?utf-8?B?R3g1THd2M3lnVFZ6RWc1YURKU00wSnh3VkNTb1o3dDVZb05LK3IzdVdIdm5S?=
 =?utf-8?B?OHJSUUJRM3ZZZDBRQTYvVjB2enVUTGRtSW9nWkJvWXMxSFdLZlBKQnZzVnB5?=
 =?utf-8?B?Vnc2L0RHd05RTG5FdTNrV01yc2NuWU5ya2Q3YjE5MTAwbktoZFdVZW9HYjRB?=
 =?utf-8?B?M0ovT1Z0SkwzcnBrSVp4YTdxQURBQnZlQ3l5MGZGTUpYRkRxV1ZqdTlEU1VC?=
 =?utf-8?B?U0VTTE93ZjZhMXhDUm85OFVwd0RKRHJ5UmtOeTlXRHJOWC9ERW1NRFc3Q1dJ?=
 =?utf-8?B?V1NaMWU1Q3RiUWNqclR0bm5DTlo3M2d3ZWZ1ZHZiVEMyRGo1ZmZqKzFNQnAw?=
 =?utf-8?B?a0dOa01RZi9uaHdlVW9wT0hCQndxNUIrc1ZObEQveW45S2d0SFpoaXZCTVha?=
 =?utf-8?B?YjBMNFh0S1Q0eFVQbUhkNkFnckRNbTd4SktJOU05ck1xNHBxNDkxZGNWZVM4?=
 =?utf-8?B?aSt3TTlnRzNjSFNlTGxyMSt5SFR4OWJQemdvVzFDZjlrOUh5MlF2cTBLWkh0?=
 =?utf-8?B?dHNRYUNabGhEZXNzREtLWjFoRUF3QjRZb0VRUzJTTzlVSUFydzR0b0RsVk5Q?=
 =?utf-8?B?VThLWDVRN05RL0lhWmFJTUs1eFJpWUV5L2VQSFY4ak1qZC9wTWcvT2doaHJS?=
 =?utf-8?B?QTZaM3hVRDE1KzZ1OHoySE92VldUUCt6NlRYZS9RMmpQd0tHcVpIN0pqVUJQ?=
 =?utf-8?B?dTJwQU1TZUFweXhGM1NORmlVZGJXbm9VTms2dnE3R1lqTVV4ZlNBTURRZWZ0?=
 =?utf-8?B?VHl3OHZwUEM5VDZMSW5iUjQrZmJoNkE5YXlzS202QnN2bGVLSzBwVGVHcGpi?=
 =?utf-8?B?OGlzWGVGTW5qdDdVZHI3TSs1TVJBZmdFbU1zTEFEVmhYMWdLcTQ3d3V0b2JZ?=
 =?utf-8?B?TGNkSjZraTFZRzQ1ZmVDL3Q1c2JFMnA1QlZzM0FEdGFtWE5odjB1cEwxV0l4?=
 =?utf-8?B?Z2cvRDBkQ2RwNHM5MHRVQ2FEUis2MHg3MURkV1I0RDFLMUw3OVdnb0NjdFgz?=
 =?utf-8?B?dWNzRmZ0aVpUVk01a3hyeTMrMjNOMTZWOGtsaUlCb1NJT3k5SThRQTZUdjIr?=
 =?utf-8?B?VFVINXRXNEZIbU56cEgwTkdVZ3RTcytGaWxkcDdCZ0EveCt0MnpwckxZdjhq?=
 =?utf-8?B?VDVhL1dhR3Eyem1ucWlSOUp1ZmN1WXREelE1UlR3QllMeTBDd3pkVVBZY3Bk?=
 =?utf-8?B?Q0UxOWU2TGpQQ3E2cXVxMVpmS04wTVRCVWZicllBcXBPcmpQVDNCVnAwWnd6?=
 =?utf-8?Q?gklN80g8RQIQZLcg=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: YbIAgqO45Jn6S4Qbcew7FD/YtqB4gjR1Rg9fJlONOSw9GRwgybr+EOaKN1DAbY0WPwJ1+CkfqINNFi9s0vNCIJOsvZYPFY3kN5v31vW4K3mf+rf+HACfQ5DwRLNLKBSqboXBELarNIFQrHn6d5xDXjeZQTdtBZHIxQbZs7OdIJDifqUtiXzRbCk7KB4hzcIXCeewuRn6lbN9XDkugjqWpattLivGtBpNNzU7Do7HheIhGPdyyhDNgLmgJIaFRFH6ZpwD0xlUydZABwP6UYyA3q3amr1iJUn7cbLyhLSgIxS6AEiSQYPrK/+cK2xzru1kWm23VMgfWdNSqzVD8rxAhQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6252.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62aeb925-1948-484e-f4a0-08df3fe39397
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Nov 2026 11:04:37.6184
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KKEz5CuVqFs0521iqe4C38NFXAWCJ0FQLk9gTRpYCtFV0AUXNLIfkhcZxXFOg/p5YaiaymG8NLB3N687V3NZ/MeDp7OHD4FZlrgNQzNbDDQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB089109
X-OriginatorOrg: intel.com

PiBubDgwMjExX25hbl9zZXRfbm9uX2V2YWNfY2hhbm5lbHMoc3RydWN0IHNrX2J1ZmYgKnNrYiwg
IHsNCj4gIAlzdHJ1Y3QgY2ZnODAyMTFfcmVnaXN0ZXJlZF9kZXZpY2UgKnJkZXYgPSBpbmZvLT51
c2VyX3B0clswXTsNCj4gIAlzdHJ1Y3Qgd2lyZWxlc3NfZGV2ICp3ZGV2ID0gaW5mby0+dXNlcl9w
dHJbMV07DQo+IC0JaW50IHJlbSwgaSA9IDAsIG5fY2hhbm5lbHMgPSAwOw0KPiArCWludCByZW0s
IGkgPSAwLCBuX2NoYW5uZWxzID0gMCwgcmV0Ow0KDQpUaGlzIHJldCB2YXJpYWJsZSBzaGFkb3dz
IGFub3RoZXIgb25lIGxhdGVyIGluIHRoaXMgZnVuY3Rpb24uDQoNClRoYW5rcywNCkFuZHJlaQ0K
DQo=
