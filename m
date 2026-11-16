Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=192.198.163.11
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794833296;
	b=zpiMekmZPLg5KEF4JTbE2nq9fZXz8sRlIDEtZG/ezlAzSyT55DnD/KL6YsXYrUbb6swT
	 o3/kHou02LTvTr81lSVPubupDkyCEoTZCOVIZ3r43DXFCGKAfHVgRvgh8Duf8i+MrOS/W
	 EIfqOlWPTv0zIbOoFkxlSStbF+8teS+YboBMze81j1VopDV7GdYAbiDZjC0VjEXCXP3eo
	 5q4rbDY1OU9tSSJQ0O+iBqpWXjM0qMI80k+NpQ5uD+Mqu3ZgpdSU6wsTVDWdaFYmHGkIF
	 OdwpkdocIcnclH03+IKNNE0B3ZTmSwjJqv97R/HZvzzSwJHsyrLfjbgpfIqAMMKwPog==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794833296;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Received:DKIM-Signature:Received:Received:From:To:Subject:
	 Thread-Topic:Thread-Index:Date:Message-ID:Accept-Language:
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
	bh=pW8IfctlMvU7Htuu1RYDUSKkMPQNlhbE2FHGUA5VGb8=;
	b=HlVhQBRtycP+KvPJUdxZuqFb6F9/R1jPk7s5VKZR3HdWjsAqv7dKUSOhqiWm127x5jwh
	 MW7z8RYrTksp7wVwcTK3fXwLV24rWpauhIOlPPtQv4B7DF9Sxdjam61O2A64SzAGSA/F8
	 UtXoQt0O6I/CpQ8S/TOEwRog41pykWa0yBCdWRULP9v2iFkL50RldbziOIjUjmRgNE4+r
	 9yyw3YTDEi8J7OsOUJcleSnHp1byW6skRCWHysU62T9v+mK2QF02uU8dOIjj3VC3YxNin
	 0h7OVAq+6K+NZrZEQYIBAz7bNE0JdNTvnhYs29TLhqGdNCpM/4IDDlEmARQAbHvZ1Jw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VxldjEPP;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=Nn+5yPz1;
	arc=pass header.oldest-pass=0 smtp.remote-ip=192.198.163.11
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7584B606A323
	for <linux-wireless@vger.kernel.org>; Mon, 16 Nov 2026 12:48:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7584B606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VxldjEPP;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=Nn+5yPz1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794833296; x=1826369296;
  h=from:to:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=pW8IfctlMvU7Htuu1RYDUSKkMPQNlhbE2FHGUA5VGb8=;
  b=VxldjEPP/b+n9CxDx9oQ5GS/J31nyMAHajQrVSWd4Gb+HmnwhxyzHorv
   dZ2P87VRPnn5u+miSwbNPtm9l8QQ+lUJQN4TqPxyPJ/UzjZe35n2fcWer
   06oI5HPAA+G8WjR01P/loYGQ2khfAih9MCu/jB9L2UP4P56FiETV+xVGt
   pwUPDEA2UDGNDNRIdj66uZd7BNk4jy34M2BGN/KgWWsZ4vtswp4rQ0gqL
   H7TxmNvm1DIGonerKBVfbbBrNNpaYaXi1rnFSr+1zYYXhWJDr1/nvX1jw
   BAKwGFTlJmqRuKQf7l2TjsRhFYjBpsPrtVS360Oq19ADX9qXy2JDYoaEA
   w==;
X-CSE-ConnectionGUID: QomCyHUPQG+pMIn+1H935w==
X-CSE-MsgGUID: XUJ8qgBnRFONN+cqX92uKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11968"; a="3484950"
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="3484950"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 04:48:15 -0800
X-CSE-ConnectionGUID: eqkimcbcRfaqYuA6y6exTg==
X-CSE-MsgGUID: AIjYTtUNTTyBHyTAOaHITQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="9674580"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 04:48:14 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 16 Nov 2026 04:48:14 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Mon, 16 Nov 2026 04:48:14 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.60) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 16 Nov 2026 04:48:14 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uNNsFFR88KlNBBj+SGi9pkOa6WG3xFi8J2/700D+oCBKLwuewzp9OJJhdGs+syF4gYcN9FfR6o4paKkixTwYRoFb0L10fHX98bQX5LuP2kMj8T/mKpjv7haZIOxTQHyoty6lL0dVzQNI5eYxMkaaW6eiXQU1EpNcxnM4iCEq/M8cfXe4VDEfliihEMrzOqgvjbQ57VHeBNandEUNRMizvg807RDps0LMbVptPVc96toZ1uSuHn2ltYhLvxKZot2Ja21jNZ4ZQvJhSn4+l4RyUITORFposoJJz98muscsirQcLxuIojh1TDhM0eDntPN+/9uHae0+jpw7N0AS1HQm0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pW8IfctlMvU7Htuu1RYDUSKkMPQNlhbE2FHGUA5VGb8=;
 b=THC4XQQzSbWPAJumaE4QkxdubUoqvPYsro6lmHKKZSBYA9fuf0jSgeYJE8iVMEJZOyiMsr1VZJauPplgFcCrYgLh1bGld8V130c6s1Eu3I71nrtQBOm/mfhAnQ0vcQOyhSLNrXlnAyHvNLOenaikSBCmdktREX+sBdGGtEgsJZFJwuSg9jIqrbh1CN9NgqPWYYacCZ6kK3EmmxAIC+i4r52vxndqYULjtzggOjF7g9Hdp7T6uO6IUk5X0aTGB5WIt7LaduXDNjZigyO8f2WKkaa92K5j4wGNrtWy1TZxgOReHtp9mqfjgOsH1xLWJKPXuDq5zRwtWG+g1/2LCAj0Gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pW8IfctlMvU7Htuu1RYDUSKkMPQNlhbE2FHGUA5VGb8=;
 b=Nn+5yPz1vsStWpGIux1osCFW6yUD07MbiyxrJArsAoU0Egp2DFP81mJd+u7QMTgihEHQ8kPHlWSqTjUyfKROWDA6m5l3K9YgIpdv7/AxGQrt3MdhX4eVHSN9J+9bH6YFvQJKI84yDCBu3MdjY3kToFkYfRy8qKMs0OVlWdJLecg=
Received: from IA3PR11MB721313.namprd11.prod.outlook.com
 (2603:10b6:208:626::22) by DS4PPFDA9EFDFDB.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::55) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 12:47:11 +0000
Received: from IA3PR11MB721313.namprd11.prod.outlook.com
 ([fe80::ece9:28d9:25bf:5805]) by IA3PR11MB721313.namprd11.prod.outlook.com
 ([fe80::ece9:28d9:25bf:5805%3]) with mapi id 15.21.0615.013; Mon, 16 Nov 2026
 12:47:11 +0000
From: "Korenblit, Miriam Rachel" <miriam.rachel.korenblit@intel.com>
To: Linux Wireless <linux-wireless@vger.kernel.org>
Subject: pull-request: wifi: iwlwifi: fixes - 2026-11-16
Thread-Topic: pull-request: wifi: iwlwifi: fixes - 2026-11-16
Thread-Index: Ad11yJgsK4OPjF0kRa+mVKcJRUGJBA==
Date: Mon, 16 Nov 2026 12:47:11 +0000
Message-ID: <IA3PR11MB7213139EC9C3BF507B8A9A3E55A37C2@IA3PR11MB721313.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA3PR11MB721313:EE_|DS4PPFDA9EFDFDB:EE_
x-ms-office365-filtering-correlation-id: f08b7a35-19ca-451b-0c4b-08df43dfbb9c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|38070700021|10067099003|56012099006|11063799006|261026121527099003|261026140227099003|261028144727099003|261021121427099003|261021123027099003|261022105027099003|261102123227099003|261009223027099003|18002099003|6133799003;
x-microsoft-antispam-message-info: CSnkyZdD0Pf+L1PbIdeAAnKO/chgfWffT7+DG10mkvfoDoCoLQqKPU6mxvnMTVdGicgfk1ZkuqUcRxmWYKCXXhnZgaeJ7NcEQqTPK1jHIubUjd0CVPFVtQqihOrvOOVchSuoYAy6V7IBCdvaZ8bJR0ToXzwijbC1wWfADJk3ogqG+G4qOs0sI+EsVW+jP41ogapdTyWY0TzNgws0LQXH94OlSMxe5eYTJa4OH1b7oxXROQNWVK81aSjoZ7eDWVMENRyWwD3X/MsDqO9JMcp4KFm9Cedbnugs/w8TEd5k5vEeXCi2oOLFHTC3av04tqCZGVz/NfbYeI8q2oDkDKSQJb7t65u9BK7iVd5FqDR1E+F86N7C0Vw8PDZEA9rrcPNICXQZwsFNkwFRSZC9kw6/sJ9YCpmAWZKeSQOFMRrX+edo0nElLJMZfr/b3QiOK8g6SFTCDVHuVgOl2Y6CLwW0W8wd/M1dlHezuiYSmYkPJhQYSnCOc6iCchHKpxG+xErgaNp1PZEmqNOBs3sSl9Ver0z7yQKDLLcuF3vdlWYup0/rt1ZGJP8y6MsfjC9NjWRC2O6fdB0QJ+S5AN7ey+x9qGVEX3sHaolfrwwVSyCSh7u36BNTOGQZskzISakGOGFM0K0F79f7XxOvmqVPPm3e4diuzN0ugNwPp8GkcgqKlVw=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA3PR11MB721313.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(38070700021)(10067099003)(56012099006)(11063799006)(261026121527099003)(261026140227099003)(261028144727099003)(261021121427099003)(261021123027099003)(261022105027099003)(261102123227099003)(261009223027099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TnY1VlZDRUJvQStueDFuaW5scW5HWEFFZEhFNHBBUE44M0cxNFZBMmJjMFN2?=
 =?utf-8?B?MldUL2VxRXEybDV2a1VHem1zTDd5MmtCQzJlektCVHlxdUFnUytoaURaUlNq?=
 =?utf-8?B?SmI3SzdNUW1nWEJFM0hFRERkYzZaekFBcmpCUE4vcVFrV3V6QXdwem1BVjht?=
 =?utf-8?B?OGlMYkxobnRhUDlHZ2xDOEhhTjZKdmd6NlFSRnRhaUQ1ZGxhWUxoMCs1U1hi?=
 =?utf-8?B?djNKc01JOWloZDRIeDVTQzVpSTRxMkt4Y2pDczBRNURyWGZIYVZ3TUxlNzRQ?=
 =?utf-8?B?M2NUbGI4bEdBTkxuZGxTY3poTlRLZkdUNjFWbktlRG1xcms5aEp2Um9lOU9v?=
 =?utf-8?B?MUsvWlNndFJSdzR0M0J0em5nRlRFeGlXcklzb0NvRVI4ekZRVVJCQVR4OE9m?=
 =?utf-8?B?Y1JDRGRkd2JydGFOYnNHUDZhZzZhRlE3VmlFZ0JoTHVpVWlxS0Rsd3p3Uy9X?=
 =?utf-8?B?UHk1aGRTZGxnZGUvdzlBc0xxWWkyRVlCTWJJSVQybzk2ZXZrUTRVZmc1MUQ5?=
 =?utf-8?B?b3RtRHl6TmZhV0hGUkdqcU5wUDVIdmdmb1c2WG1CSmZmT2hiVVZ0Q0xoMENU?=
 =?utf-8?B?RmtWMnk3aUsxZkxTcTZ2TEdBQ3RUUEdHazE1Rm9tU1RoajAzd2dwdzlVN0J5?=
 =?utf-8?B?OWFaRWdkaUptZU82bWVMWmZyb1hGcGtWb1Y5MVBJYW0xdHl2QlEvTXlmQzRX?=
 =?utf-8?B?UjVTZzUvbUdmaE1OeklRK3k3ZkxKR2dIRTNKd3R5bzRJWUNWdUJiWExuam1m?=
 =?utf-8?B?S25rN2crVldPNWtHSmpHUG55KzhJb0ZYNzcvenRVRjZ4OWYvUUMyTkRXRDhx?=
 =?utf-8?B?QVVSL0VXcXdZeEpFMG5OaHkrSnBNZGpwbGR5VUllNkg0YUloTFFGb01ZSHdh?=
 =?utf-8?B?Y2phTjliSjBmWFgwYjluSmg3b1g2SGVnekFzNGpYc0kvWVZLTUR6bS81ZDh3?=
 =?utf-8?B?citSeFY4KzB0cnhJNnpFZGs0UmE0TEIxNE5jMzE3dncwYmd6bXlvZEkraDla?=
 =?utf-8?B?R2paODdLVUJXMWZDdGk5T2hnUjdyTzBNcFR3eENBT0Q0UGpQQ09tRTMrZlgw?=
 =?utf-8?B?WjF6cUp5eEVUWEdZYm4yNkJPNFRJbTZDcEVjSERoWGRndWdlVjllU04wRTdq?=
 =?utf-8?B?SmhIVi9RTmtWallRd3J3c2FEL0l2eURCNE40ZEtBQzM0L29DRHZqODJEYmZ0?=
 =?utf-8?B?SDhiWVVzUnZaOStpRXJzNGhmOGExa1hCT3ZsVnBzWEtENDdPM0tBbDlXd2pk?=
 =?utf-8?B?T0JpRE4vK1laOFFtZnd2Lzk3b0dVZGhCQ2cxT215WnJ4YThxY1ozZEt1M2Ew?=
 =?utf-8?B?SEdCYWJXMm91WWxTd2swdWdrM1VOQVBQUzRyemswWEI5MjF5ZFoxY205ZEJm?=
 =?utf-8?B?Y2JmTzVFUFlJN2VUVUlWUVl5RUYyRGFmK3g2T1FNU2JkL3RuaU91YWRYaWp1?=
 =?utf-8?B?WnB2STJnaFN5V3ZKWlBrS0tTV2YzbFRmWStTSXhubC9ZZktPRXZCTU5QOU9B?=
 =?utf-8?B?eEVONXpNb1plSUtRVTRCYm5INDBUODBNcFhkODFPNElSM0tsOFBJQTJ4UFlU?=
 =?utf-8?B?R3VFeCs4aWxpZmh0WGtDdmhra3I1bVpYM1JNd0dLU21lZytVbjdLQUZueWVV?=
 =?utf-8?B?dktGMlY2U0xyYUF6U053U0QxbkpoUjFmMS9ENjFwM2NGdDdkMUhvdmJIN1p5?=
 =?utf-8?B?Qm84VDNCTnV5TEhxYjNsNFdORXN0MlM0TE12Y2hWNnY0N3RXSkNDUERkbWNs?=
 =?utf-8?B?NEcwaDYyTTlrbnYyWG4zNXhKVGNiek5jRDJUbXMzV01iQWRpT1VPeUF2L0pL?=
 =?utf-8?B?V3hwN2t6NXZLWUlKb3JaWmMvNDhiR004M0FZWkRYMVRpWkZhMUx2Q3RYSE9o?=
 =?utf-8?B?ejNGcWVObERPNnZYSmh2OGtqVURVbTIxbnVFdG55WUhJK1NVcWpqQnBHdmdh?=
 =?utf-8?B?Z1lsR0w5T1FRRFRCUmFVSVRYQk1vZVpDeUdCWU9xMXhkdXI3alFkT1RSS0dt?=
 =?utf-8?B?b1Nyak1RM2VGWUdHU0pHM21kTEtFMTVhZEVQZGJEQ3NpNmZBRUpiV2tsWWwy?=
 =?utf-8?B?ZWkxRkdPWXdFaFg1ZE93OGtELzR1a1VCQkhYaHE2M0NlTDZmR2x0eWxSTzZV?=
 =?utf-8?B?WGkvcnF0ejRXQjA1OVhCRW9ENUo5OGlTdEhjaDF6RDNqYUVEMytPU3o3SFhF?=
 =?utf-8?B?WlVaZ01ZWGx4QjJ4UGg2U0Y0SkFzNEF1ZjAxd1B2L3VWalliNXBVM3lROWlT?=
 =?utf-8?B?L3BDV2ZFWmtiSEY3RkdlbldzZHNhWTRnUWkzK3E2L2pDaUwyL2d5YzNyOWhU?=
 =?utf-8?B?VDdtaGpqbmRlZUMrdElEWHNtZW84RzFiNFNXQmw2Y0w0UEhIZkVCRjJYVVcz?=
 =?utf-8?Q?Lgf5StfCzOrzN/e4=3D?=
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
X-Exchange-RoutingPolicyChecked: YkjAW96vh88XilH1txsEDcxzhiCI54Elx2yKhFxf+WBw5rB/STa4h9U3djdl5vpZONOZRjkUrsQ0+zUIdJLk/SScIFaPK/ip54o9nF2NXu7z76VTbuDTqb5HLRNJCZQeOUp2KNKV+MRNh9fJb/NId4Q09qh2T54fi4ruQR2QONW7FG22AeATmh2206JC/j0FyTToo9zqxIE1WDn7dBd8ADdlK2fg37DtlHLLBLiDnGfOd43VHoMC89QiDdjjyPEL3pOzAZZi8RmGAoGqs4vLfxRiRvl5qxbnRfYvX6FPjTodS4Drv/C9h4g7JoFRpxXP4zhYUWlf4oCA0hRrBA8BfA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB721313.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f08b7a35-19ca-451b-0c4b-08df43dfbb9c
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Nov 2026 12:47:11.4223
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: H9OHSfzhSPr1tUuHITk2IBHtTGcrDVo4vCK8WmM1F7xfYwyaN2Hm9TWBHz2J4Yn3ETFYjFzrZzAzSjqWLd9PZOFi6x5rGhFM4aoykq0a7hZj3UVObAlW0X6rqoZR5pmi
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPFDA9EFDFDB
X-OriginatorOrg: intel.com

VGhlIGZvbGxvd2luZyBjaGFuZ2VzIHNpbmNlIGNvbW1pdCA4MzFlMzNhZDAyZmY4ODRlY2M3OTNj
MDdhOWM5YmQ5ZTA2OTQxZmU1Og0KDQogIE1lcmdlIHRhZyAnd2lyZWxlc3MtMjAyNi0xMS0xMScg
b2YgaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvd2lyZWxl
c3Mvd2lyZWxlc3MgKDIwMjYtMTEtMTEgMTQ6Mzg6MTMgLTA4MDApDQoNCmFyZSBhdmFpbGFibGUg
aW4gdGhlIEdpdCByZXBvc2l0b3J5IGF0Og0KDQogIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHVi
L3NjbS9saW51eC9rZXJuZWwvZ2l0L2l3bHdpZmkvaXdsd2lmaS1uZXh0LmdpdC8gdGFncy9pd2x3
aWZpLWZpeGVzLTIwMjYtMTEtMTYNCg0KZm9yIHlvdSB0byBmZXRjaCBjaGFuZ2VzIHVwIHRvIDA2
Y2ZiZjIxYjMzNzcyMjY2YTAzYTU4MDE4MmI3NDIzM2Y0MWYyYjI6DQoNCiAgd2lmaTogaXdsd2lm
aTogbXZtOiBjb3JyZWN0bHkgY2hlY2sgdGhlIEFQSSB2ZXJzaW9uICgyMDI2LTExLTE2IDE0OjMw
OjU5ICswMjAwKQ0KDQotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tDQppd2x3aWZpOiBmaXhlczogMjAyNi0xMS0xNg0KDQpUaGlz
IGNvbnRhaW5zIHRoZSBmb2xsb3dpbmcgZml4ZXM6DQotIGRvbid0IGNsZWFyIHRyYW5zOjpjb25m
IHdoZW4gaXQgaXMgc3RpbGwgdXNlZA0KLSBob25vciB0aGUgcGVyLWNoYW5uZWwgMzIwIE1IeiBl
bmFibGVtZW50IGZsYWcNCi0gcmVwb3J0IE5TUyBjb3JyZWN0bHkgb24gb2xkZSBkZXZpY2VzDQot
IGZpeCB0aGUgY2hlY2sgb2Ygd2hldGhlciB0byBlbmFibGUgZncgcmVzZXQgaGFuZHNoYWtlDQoN
Ci0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0NCkVtbWFudWVsIEdydW1iYWNoICgzKToNCiAgICAgIHdpZmk6IGl3bHdpZmk6IGhv
bm9yIHRoZSBwZXItY2hhbm5lbCAzMjAgTUh6IHJlZ3VsYXRvcnkgZmxhZw0KICAgICAgd2lmaTog
aXdsd2lmaTogbXZtOiBkb24ndCBzZW5kIExBUklfQ09ORklHX0NIQU5HRSB0byBvbGQgRlcNCiAg
ICAgIHdpZmk6IGl3bHdpZmk6IG12bTogZml4IFZIVCBOU1MgcmVwb3J0aW5nIG9uIHByZS1NUSBk
ZXZpY2VzDQoNCk1pcmkgS29yZW5ibGl0ICgyKToNCiAgICAgIHdpZmk6IGl3bHdpZmk6IHRyYW5z
OiBkb24ndCBtZW1zZXQgdHJhbnM6OmNvbmYgd2hlbiBpdCBpcyBzdGlsbCBuZWVkZWQNCiAgICAg
IHdpZmk6IGl3bHdpZmk6IG12bTogY29ycmVjdGx5IGNoZWNrIHRoZSBBUEkgdmVyc2lvbg0KDQog
ZHJpdmVycy9uZXQvd2lyZWxlc3MvaW50ZWwvaXdsd2lmaS9pd2wtbnZtLXBhcnNlLmMgfCAgNiAr
KystLS0NCiBkcml2ZXJzL25ldC93aXJlbGVzcy9pbnRlbC9pd2x3aWZpL2l3bC1udm0tcGFyc2Uu
aCB8ICA3ICsrKysrLS0NCiBkcml2ZXJzL25ldC93aXJlbGVzcy9pbnRlbC9pd2x3aWZpL2l3bC10
cmFucy5jICAgICB8ICAxIC0NCiBkcml2ZXJzL25ldC93aXJlbGVzcy9pbnRlbC9pd2x3aWZpL212
bS9mdy5jICAgICAgICB8ICAzICsrKw0KIGRyaXZlcnMvbmV0L3dpcmVsZXNzL2ludGVsL2l3bHdp
ZmkvbXZtL29wcy5jICAgICAgIHwgMTIgKysrKystLS0tLS0NCiBkcml2ZXJzL25ldC93aXJlbGVz
cy9pbnRlbC9pd2x3aWZpL212bS9yeC5jICAgICAgICB8ICA0ICsrLS0NCiAuLi4vbmV0L3dpcmVs
ZXNzL2ludGVsL2l3bHdpZmkvdGVzdHMvbnZtX3BhcnNlLmMgICB8IDI0ICsrKysrKysrKysrKysr
KysrKy0tLS0NCiA3IGZpbGVzIGNoYW5nZWQsIDM4IGluc2VydGlvbnMoKyksIDE5IGRlbGV0aW9u
cygtKQ0K
