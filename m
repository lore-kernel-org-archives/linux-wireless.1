Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.9
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794410490;
	b=izSZjcoBOGV/qTF/3XJWN5//lK2XUc4B+mLoS3C1gDg4gqKPgCQ/GYmdE0Y8b/wg8XCc
	 kps6SI25sh7V2dF/eY82AMUjVyL3mnY5FNrpC2+/05oWG9LgGO7Fo8idYpfBY4Gr0iTzP
	 1Ndpjh3udrm1k9qOZcgtmKct1Ai/TqJeRIieOm7p/CDUsyacO/P/5pJh3LQUJX583Vou4
	 mhpipkW7mcKETd3qHNy/Mh5yEvq57izLz39bYQhp4qMEjMtoTBLIVZYzdTKtMl+70ph6N
	 jeAzzE9/0M+MS1yqwn+bG7UIUm7kNvykaRVnptkuWzio8FXjBkcW9SoK1t0XfMqIJzA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794410490;
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
	bh=GS9HjtaE7119gl/NreQ1EoMNGwvARkmmPu4oxJkORkk=;
	b=vPRwhEJTDw4FlCVjyM6qDY6/oti5Mm7ldQQhtSF+VfG0Kx8xVgTrBYhmpLIMW4YhdOSl
	 /HGk10jOR/QqRyUo7MITW4FdoD99cyTf4WCwS/CSAZr2I+oFIUu4C7zrnWajuCBLHDHWV
	 K/D6e8iPjG2VyZ/RX2QvNSyRt67SbtgpuGB7x3Xu7tyITQ2k4jMk7y9Dg7okIcS9gnAAF
	 whUPiEYr/wqHiZm6oWPUBpv+lYX1UnEictK/SGP6Z6T5yskg9iU5Gs2hGKFSaq6Mfk6R4
	 262NTRLPmhRQ5Kf+Lki7Iu95gJYLK2NO8BYwPJ7WNV4NkOXKfrTZN/KqiWKdZRDD4HQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YvEVtMVl;
	arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.9
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0C54606A326
	for <linux-wireless@vger.kernel.org>; Wed, 11 Nov 2026 15:21:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0C54606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YvEVtMVl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794410488; x=1825946488;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=GS9HjtaE7119gl/NreQ1EoMNGwvARkmmPu4oxJkORkk=;
  b=YvEVtMVlUeozko/R5eiPpL7fRnFEUtPVbwQVkwt8ZByaW95MlYz72a3W
   Nc6W5WohopaNZ/8VsPuUGOw0555LTThyFQmRPWZqR95tDv+9G5ypYB0hh
   y7Zvr2CbCt6/oIC+BDMQ0mtFprQMP21uIHgh/cDNDeLm0NuvbjUqUgk4+
   c4XUC36TDDEGZ7KjisMCgo9dKmmNjDiU3/8BIqsPkAGxEASj46OM0nYqE
   9p7u6eT1z//WD43JEruvt6Kc7Bdwag3KtcwJ/Twxf7QeFkVrIznZRVBOU
   nqbKqKlR2XE2AUUjCj+XuxD9Iqiz88cWh678hhWJSLe5gJ/8NDx0vCTql
   A==;
X-CSE-ConnectionGUID: f3U8AeRQSlOhmnPPEK+kAA==
X-CSE-MsgGUID: yxf1irnFSoWaETkJPeGyiw==
X-IronPort-AV: E=McAfee;i="6800,10657,11963"; a="3092901"
X-IronPort-AV: E=Sophos;i="6.27,208,1787036400"; 
   d="scan'208";a="3092901"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2026 07:21:27 -0800
X-CSE-ConnectionGUID: Kb7Kgmu2QL6gkfDba8XCLg==
X-CSE-MsgGUID: mzA0IhtuQ+Gjpz4Y2XMuwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,208,1787036400"; 
   d="scan'208";a="8873861"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2026 07:21:27 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 11 Nov 2026 07:21:26 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Wed, 11 Nov 2026 07:21:26 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.36) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 11 Nov 2026 07:21:26 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lmiGxYqd+w/RKuNlPtzkDsswaO9oec1wduDSaZRGiPgo/u22wfeUJiDW6bbX664PUIR/kDlsB4UnG8Z9Ek0Pjkac5A1p7cQj5XKWl0QRAGpnPv5f7fL03aHqxB3iDG0ku7F+Zg7To1PCRBByHiw55GVwnK6U9xp3wGTZgCjkyICcLC0rTsd04e6zSNJVQSmnDtqEGJWsp6KSQNS8vxaSYmG6x2FU36NT+o4QaDSoLYF5YqtFKFxgNRlbokF0oYryQ4vWOGmbchMff1kEbPaAYqQIP7KgRgkmpudGLXw5FsZgxnY9d/uHB3CvcWDw6WnIuVhGYnAN+LUKYh0Djka2bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GS9HjtaE7119gl/NreQ1EoMNGwvARkmmPu4oxJkORkk=;
 b=E+oiZieUunXOBp/wQjn0nU0GkgpBky/LdnFghDWlxWPZUSh+0EDRbngbMgo5l/6rwEqvr5JZZqp3ebM4zSqJlE8l98M+yBTmIVDkXeID8/3iuniVjMmGapqqZxFh29Od+0mgip4d9DxbcH2ySynYB2+wMVMngYpxwdxb7/bmCO+TvY9nJ2tRs3ZPvVmblSFmPYpghALbs8C01qSsj+tuK7sKrMw9MynMXc3cFhepzUU+bFN+wE7jjKvuPNk9lKCxX90Wt7eejgo4eBwvPm568cYgxZNrgBpuuQBTVmV+gHdP4kVG3CmLEIVPah2etj+VH5x4N6zYpP9fY0nQ6dyNzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6252.namprd11.prod.outlook.com (2603:10b6:a03:457::21)
 by PH0PR11MB5829.namprd11.prod.outlook.com (2603:10b6:510:140::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.9; Wed, 11 Nov
 2026 15:21:23 +0000
Received: from SJ1PR11MB6252.namprd11.prod.outlook.com
 ([fe80::7d3e:3000:9690:1570]) by SJ1PR11MB6252.namprd11.prod.outlook.com
 ([fe80::7d3e:3000:9690:1570%6]) with mapi id 15.21.0615.007; Wed, 11 Nov 2026
 15:21:23 +0000
From: "Otcheretianski, Andrei" <andrei.otcheretianski@intel.com>
To: Shivani Baranwal <shivani.baranwal@oss.qualcomm.com>,
	"johannes@sipsolutions.net" <johannes@sipsolutions.net>
CC: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
	"kavita.kavita@oss.qualcomm.com" <kavita.kavita@oss.qualcomm.com>,
	"vamsin@qti.qualcomm.com" <vamsin@qti.qualcomm.com>
Subject: RE: [PATCH wireless-next v2 19/19] wifi: nl80211/cfg80211: pass
 Instant Communication frequency for NAN offload
Thread-Topic: [PATCH wireless-next v2 19/19] wifi: nl80211/cfg80211: pass
 Instant Communication frequency for NAN offload
Thread-Index: AQHdcM5Hjk/NIS5zA0GVt2l8JQRZWbco9udw
Date: Wed, 11 Nov 2026 15:21:23 +0000
Message-ID: <SJ1PR11MB62527792541B5E64A14314FDF5712@SJ1PR11MB6252.namprd11.prod.outlook.com>
References: <20261110043242.2012238-1-shivani.baranwal@oss.qualcomm.com>
 <20261110043242.2012238-20-shivani.baranwal@oss.qualcomm.com>
In-Reply-To: <20261110043242.2012238-20-shivani.baranwal@oss.qualcomm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6252:EE_|PH0PR11MB5829:EE_
x-ms-office365-filtering-correlation-id: cdf0984e-667a-488a-6870-08df40077221
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|38070700021|10067099003|11063799006|4143699003|56012099006|261021135927099003|261009223027099003|261026121527099003|261022075727099003|22082099003|18002099003;
x-microsoft-antispam-message-info: KgmqFHGydpJP1d7MrHzu0NqfSIRU0RACqrtG3Ku+Tyz2neWI2rMPbaen5/CAaJu1meappjMdMk/c+CBs48sF2rRKTQ8mZutBN3nMoiVg2fFNtIns697XpfwV6UU6sUfx4IRwmcxa13QLKiyveQXZXCRKmGpuTLOiImPWyTtGhLM+Y3dC8QoQ3sOIr4yYUW0bzvPe4qPEjHpz4QnSIMz4jKaGWunh0AxTZWB5JbZ+FaZY71tYN3ZdxQ8YhpB+iHBD/WohisR/QKRXADcXOoni3mDGraysZsVFnUBrnY37K5hMVrg+MAbKCPYYeyGNzS6l+OdH9/VVaVND6gWTM/8tcfC8W/QdBCbAJpetYaEI7rAlt2nfRKATMAq5HZTNx4+6B2DYNbPEdykKqyr92smw9IEW0ItyIHpKpteDGwGYcLCFuQTqxBvVyqj17rUU6ICihQSCKz+y0eNT/Q7PZmU51R7ifJwCzQjbCkvy/DYOynUBzKIc/jEYd2pn5jRnE9JHcwyzgVPoUGHUZQR/RIFf/LRMLnpKb1gb8kqZCofyuzuqiNipIsNfTeBdGonViMbT6jndqqqNsrxFZ2h0A4n8/njUvFwVS2ozBTNJewTMhCzurj/wl3QRQFL0ihB6pgh5RiVIj6tr47fhDyfokvLV+1y9FcHdHXb1FFU81MDTI/POn9zZnKCI4717Yy38uVywrUM2Zuepjq4VieN/ee5nBqbheR1PMovw/n242yBsfx0=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR11MB6252.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(38070700021)(10067099003)(11063799006)(4143699003)(56012099006)(261021135927099003)(261009223027099003)(261026121527099003)(261022075727099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RW5qang0VXBLbWkwMTh5U1VabUtVcFROSHBwL0hpT1gxTGhBdnVzMitsVm13?=
 =?utf-8?B?d2JCQSs3QSs5b243WUI3SE5UTERSR3YwRE85T2kvamhFRXRidFJ6OERnYXJ6?=
 =?utf-8?B?elc1UW0wQTJwL09OZVcybWtDQk5FSlVycnYxeGlXYURLSjl3Yjc2ckpoWjA4?=
 =?utf-8?B?bk15bkpMME9la0JZd0hVMWNXUFgxbVJQNURHZnlQekxsVy9IaENJK09uc0Vo?=
 =?utf-8?B?SXpwQ1k0ZHo0ei9SRzQyTHZQRG9qa2cwNmVnbkVTY0tYLzRTYk5iTCtZbUhl?=
 =?utf-8?B?ajNEbEFxN3p1WnRwQzdHdUdEem9sNDVGRkJzbDFlTDFaUzZGMWEyVkNJOTI0?=
 =?utf-8?B?OHg2eGkxUzhNSks5U3FHUGxQWTBxK1I1a25qdVJOOFYzYmlvSzlHdFh5UjI1?=
 =?utf-8?B?NmxRUW9iUnM4bldPSGE1NE01a0Q0VjErdHdoeFJLTVhBZ2FIakF1YlZvek5F?=
 =?utf-8?B?RzR2eHBmNFpobEpLVi9wYkRaeHAyeG9zRS80enFOOUltRTRLV0ZjYkQreUd0?=
 =?utf-8?B?ejlvMXd1a0YvQW1MUFBzaFh4c1cwemtWR0dleHJ6OWJ1cnJPVnBnZGVFSk4r?=
 =?utf-8?B?QUFaRERQeTdHeStnNlRJMGEwQTlpYWE0MFl6UlFTbjdDbHJmNS9kVk1WTU9K?=
 =?utf-8?B?N3hydVZTVlptSGl2U2dTQmhGTS84U2ZWbU50dENOT2xwOFl4TjFURTJkWkVs?=
 =?utf-8?B?cFhEQWxueVRocGNCZDNOS2h2MjI4NHJVSEQ0NXRQRGtDYjhDQmRvL2tjaFEr?=
 =?utf-8?B?cmlCTXFzNkRrQURQeUg0QUI0Tzk2WjJyT05qVXdtM1NRVHRZcDRzMHExZFBt?=
 =?utf-8?B?OHRUQ0N1M1RWeU9xbGRJaEQvcVN1MTFzdjhXQ3hrOWRzQmNkNnFMNk9LZFlW?=
 =?utf-8?B?TkN3WkpDckZlY2Z2S3ZWcDZCZlEvSVpyZlowVEtjOXVFeUp4a1l0alg3ajJu?=
 =?utf-8?B?MWV5cWpySjREKys5WE1hak52bmE2L1hSMld5N3FQZzlXTzZZSFkyOXhmaVFr?=
 =?utf-8?B?SkMzMyt3eDFoU0FEVTlGMlF5RFJMVFNGcXVBWkh2TkxWQzMrZXBTbmEzVDNt?=
 =?utf-8?B?T3BMMTl1WU5hQi9XTzJHNmYyOU1vYTZuTWhxZTA4cXZmUEFiOFRTSWQ0Rkpm?=
 =?utf-8?B?QWdvbmdLVFluZGIvVmFZUXJvTmxUWWFjZVg3TVZqUlc4cFB5eEI3aDRxZStz?=
 =?utf-8?B?THBRMXRmMWVVQUdRc2wrNlIxczlvVnRLeGNUME56dzNlNSt5bnB6VlozbzlT?=
 =?utf-8?B?bDNQTzN5bmlsWW5sU2Uzb3VJNUZ0czlJNGZ4Q3hUUFlWR0FqaWF3bkkrNk9H?=
 =?utf-8?B?L2NFVjBDQUFQNk83cUVtSTY3RW45cG5aUC9HNWpoMjY1c29yaEswWXEwOU9s?=
 =?utf-8?B?ZVR1WE5GQldWR0c1STVNSU1hR0FSUDRDaHAxak1GL1ljeFhqOE5OMmUzenN0?=
 =?utf-8?B?UVJzV1ZFQ3J5dzk5akIwTGozWjRHQ2lNTjNTRzNsVTQva2NUeFNGM0t1MzAx?=
 =?utf-8?B?RjJIbElhSHVreEgxNTlYYkIvVmJHUGdPQ0ZkYk9zOEFIOGhEeENsbEw2YUN1?=
 =?utf-8?B?TUpCdFBzZEN1bGgxUHAxckg5ZkdZenlUaGVRbzVSQ3dWSzRhVGpWZEt1a1BL?=
 =?utf-8?B?ZHZSNmNKbTRlSHdUdU9qZXU3eFZNWStqUEpWRnc1VUNOVFJxcmNKbXlBMkxO?=
 =?utf-8?B?VmV6Uk1oN2dERG9SK1N0T2VMQ0dTTWJnYTVGbzZvQzAzWU41d1R5UXluNGh4?=
 =?utf-8?B?cVFLVEtvR3VteUVhWVpweGk3ZkdkTEFqVGpnYW9VeDFyT1p1S0ViMktpTVE3?=
 =?utf-8?B?bGJiZWZFSDd0dzRWNkxPbHdpcFNHMEdaMklJZGg4WW4rV1ZtYytPS3V2WDdE?=
 =?utf-8?B?UFRpc01UL0ZhVFJKbmZUbU5JL0lYY2dZRUd0elpQUnpxTjFGb1Q2Q29hWXZT?=
 =?utf-8?B?N1IrcVpweGU0azNsSEVZZlFoZ2RqTFo2cGpsNUNaVXRvWTAyNnVkdW1Jcklx?=
 =?utf-8?B?ZEZocWFiYy9VOXpJT0NicHZDQjFqbDYyOTBZcUhLTk5jZjRvVlZ2UytITDY2?=
 =?utf-8?B?MXQrTnBNazVFSmFhOWh0WXduUm9wTkhWSWcrSkUrRlZzZk9MY0hwM2Y4QllN?=
 =?utf-8?B?UWpDMHE5dEJFWjNnb2hHNjJSWDZHSXN1NjROZFZ0L3FBYmwxS3VrQWF1M0lz?=
 =?utf-8?B?RUtxeWZ2TDE0RWU1blJSVEhURWlTT3VwU3VlWUdEUW9BZTlGeUhMR2MrRTFj?=
 =?utf-8?B?RHNtK3I4bEQ1UmpIZTdkeHhjQ0libXFYa01yZVIrZEpsNk14UmhISlB1WU1h?=
 =?utf-8?B?U3MyZCtrQUJuOTZKYXF2UGlFN01TOFRlV2ovTVQ3VE9jUnB6dld0UytLMENk?=
 =?utf-8?Q?1QoR6PZxUvngjGy8=3D?=
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
X-Exchange-RoutingPolicyChecked: cA38kbl1WuBzC2re11DTQs5EnpcjLQC8GuSDvmVR08T0+1TqVJS+w2yScLQRxi12loeOhVafUW+KMCBZ9Me1iOqcjM2qSr7Hmjggg8md9XjD6BYW13PGHmNuzcx/bvy5zaUGE7JKixOpDU7FBXq3dc4+nxYZR/lY6dwPAGbxhaRYP4bbJkHTLYdmPrMTpQmf6Fyx4LHI6+W7N3WX0DRJOnOHEH3P4VbYu8Iw5vLj5g6w09CksKQUfcaNYnv2p/DIFYAcE63zHN5RJGJfBY/M6tw/RLVspjIAIKg9GBkwgGmxe03Q1SKTCZfq2dOjmyjeEuVlyQlXugWdF8tTxSbTqA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6252.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cdf0984e-667a-488a-6870-08df40077221
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Nov 2026 15:21:23.2887
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cOQkXhl68xv17I/7+SpAz9T32n8Qhy7oHsCzN2VhNEfJ+0JuO8Qbm5rTwOBsNWSC2iu0lP9NJO2aDuzHDzLn5Re87kny3HtidB3TE3YRQ9E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5829
X-OriginatorOrg: intel.com

DQo+IA0KPiBXaXRoIEluc3RhbnQgQ29tbXVuaWNhdGlvbiAoSUMpLCBkZWZpbmVkIGluIENoYXB0
ZXIgMTMgb2YgdGhlIFdpLUZpIEF3YXJlDQo+IFNwZWNpZmljYXRpb24gdjQuMCwgdGhlIGRldmlj
ZSBoYXMgdG8ga25vdyB0aGUgSUMgY2hhbm5lbC4gV2l0aCBhIHVzZXIgc3BhY2UNCj4gTkFOIERp
c2NvdmVyeSBFbmdpbmUsIHVzZXIgc3BhY2UgY29uZmlndXJlcyB0aGUgSUMgc2NoZWR1bGUuIEEg
ZGV2aWNlIHRoYXQNCg0KVGhpcyBpcyBub3QgcmVsYXRlZCB0byB1c2VyIHNwYWNlIERFLiBUaGUg
ZGV2aWNlIG1heSBvZmZsb2FkIERFLCBidXQgc3RpbGwgdXNlIHVzZXIgc3BhY2UgTkRQL05ETCBp
bXBsZW1lbnRhdGlvbi4NCkkgd291bGQgbm90IGdhdGUgaXQgYXQgYWxsLiAob3IgbWF5YmUgY2hl
Y2sgV0lQSFlfTkFOX0ZMQUdTX0NPTkZJR1VSQUJMRV9TWU5DIGFzIHdlIGRvIGZvciBJQyBzdXBw
b3J0IGluIGdlbmVyYWwpLg0KDQo+IG9mZmxvYWRzIHRoZSBEaXNjb3ZlcnkgRW5naW5lIHJ1bnMg
SUMgaXRzZWxmIGFuZCBuZWVkcyB0byBiZSB0b2xkIHRoZSBjaGFubmVsDQo+IGluc3RlYWQuDQo+
IA0KPiBBZGQgTkw4MDIxMV9OQU5fQ09ORl9JTlNUQU5UX0NPTU1fRlJFUSBmb3IgdGhlIElDIGNo
YW5uZWwNCj4gZnJlcXVlbmN5LCBhbmQgcmVxdWlyZSBpdCB3aGVuIElDIGlzIGVuYWJsZWQgb24g
YSBkZXZpY2UgdGhhdCBvZmZsb2FkcyB0aGUNCj4gRGlzY292ZXJ5IEVuZ2luZS4gQ2hlY2sgdGhh
dCB0aGUgZnJlcXVlbmN5IGlzIGFuIGVuYWJsZWQgY2hhbm5lbCBpbiBhIGJhbmQNCg0KVGhlIHNw
ZWMgZGVmaW5lcyBleGFjdGx5IGhvdyB0aGlzIGNoYW5uZWwgc2hvdWxkIGJlIHNlbGVjdGVkLg0K
SXQgc2hvdWxkIGJlIG9uZSBvZiB0aGUgTkFOIGRpc2NvdmVyeSBjaGFubmVscyBhbmQgaWYgaW50
ZW5kZWQgcGVlciA1Z2h6IGNhcGFiaWxpdHkgaXMga25vd24gKGFuZCBzdXBwb3J0ZWQpIGl0IHNo
b3VsZCBiZSA1Z2h6LCBvdGhlcndpc2UgMi40Z2h6IGNoYW5uZWwuDQpMb2NhbCBkaXNjb3Zlcnkg
Y2hhbm5lbHMgYXJlIGFscmVhZHkgY29uZmlndXJlZCBpbiBiYW5kIGNvbmZpZ3MuDQpTbywgYmFz
aWNhbGx5LCB3ZSBvbmx5IG5lZWQgYW4gKm9wdGlvbmFsKiBmbGFnIGhlcmUgd2hldGhlciBoaWdo
IGJhbmQgaXMgdXNlZCBmb3IgSUMgY2hhbm5lbC4NCg0KQW5kcmVpDQo=
