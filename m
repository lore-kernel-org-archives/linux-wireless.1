Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=192.198.163.19
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794408086;
	b=35rfKONTNxNhEsHRpSZshNyjxJKTH2HdgFy6a1oYslK8gH2i5KRwbzCNADSS3gI3nV4n
	 f4cMfNXMKi1MsNsQbf6f6Fd4JUQ0yVRKx76J2e6yBLiZy6d6FxJpn6pvcCjvPNSCkmsij
	 efE60FzpqwZWela/5VHX41/6IedQ/1eXDyJzsHlLgKX4JAXfLek68fJLr6Ns+qdMXBEcK
	 tPvJhpB4c0TcVSkwdvN+s/72jo8jL5vF1U7ZJH0lUxh5YS81SBIH7xfMZePyrNtG7ulMj
	 6fJq1e7bFZCUdWcsewexiCC5Eb3r+mox/DRflHTh4cH2eqSuZ2aaBhJ07fN5vz2qpfQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794408086;
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
	bh=/iIBXBPmbIH26yoSASp8PS77UuidIXDCzCXbbtbHYA8=;
	b=Pow/s260DyqojOf/9MHELhRr76C0+3WuOazMz19pyI8s0elk8Le3uLj8fWxSvZadXJII
	 dZSoQvcujjX/g6GnhHJbqjvWECLQND0ploXRBBFChMdAfOIsvCZCUZcjrXOG2zfNamJRf
	 oAO/M8oHc7HwhwQ/vjC1vqphXjpk1sEap+Dc2zsskKF55aj+pDIdAwuQQbq0HK26CcxRc
	 oKpaR168eyZrJY5gfLGzEvXxrQ4oniaY4WAGMF1nH9e9nP5U6FF+Y+BvA0MBlh6FuYUqS
	 uyxpfjWQS6bK9oXBFQGrpsIn0pyLiXMpTpGFRdtHScyficZ+nElRzVEiwd4HLnLkaIw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dk0S57lx;
	arc=pass header.oldest-pass=0 smtp.remote-ip=192.198.163.19
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3853606A881
	for <linux-wireless@vger.kernel.org>; Wed, 11 Nov 2026 14:41:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E3853606A881
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dk0S57lx
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794408086; x=1825944086;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=/iIBXBPmbIH26yoSASp8PS77UuidIXDCzCXbbtbHYA8=;
  b=dk0S57lxLnfiLEb0pqdPMAk2bFp1lYIyayp2O7GA+CtFDegvq1LwW6zq
   ZW82d4EDH0tsMrw7PtPohtE/AHvRBiYzPa13Y5qkCIEqJJGvZ9J+Fu1ua
   v6m+XiGLEg/tqu+ded1gs6xg2QqNcsWsthIvfFAWdKY5rFA8xYB7DCiIQ
   1gaBHSjdojELcqeNFNk7O/Np/N1G5CSOO4XFWQzLdQ8Oi6Oxz4S4JZf3D
   DIXiynixtruHrrxuXBUss6+tcaonm8C2ncHdfwKRczkaEkb9YDWUlprt3
   mP49bdmlf6Ul8WVNL+kzgBvo5WbiY2XSg5oTjVddmsstsAjRKdQgpRT3k
   g==;
X-CSE-ConnectionGUID: R4sVSk+CRiOTrncg8z0aRg==
X-CSE-MsgGUID: 19zck1bkRWOjW8ahbZHYLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11963"; a="3276365"
X-IronPort-AV: E=Sophos;i="6.27,208,1787036400"; 
   d="scan'208";a="3276365"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2026 06:41:25 -0800
X-CSE-ConnectionGUID: Wm9YAWYrRPOWYdCBkgVGjg==
X-CSE-MsgGUID: v7etU+vzS0GKpCOvI86qyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,208,1787036400"; 
   d="scan'208";a="8322370"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2026 06:41:25 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 11 Nov 2026 06:41:24 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Wed, 11 Nov 2026 06:41:24 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.17) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 11 Nov 2026 06:41:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EOtgOiZ76uPt2FISqREMr7tV3c0DeKtPNu/Vbv68v1FbwnP/8OYV0WfDYOWw7VcVKlnISO9VxJIMLR41iYvKLeRD5Xhoqo4RV96N5jpzHihKWJI2OPaekc14NgYjRQlp3DrEYAm9c0ElHvpNR5+uj7eI8ooo7bLwJraMICpKNocIrd9oEPOq0kn4IpQObMIIfcd+F4PPcdMl/3avTFT7B7U3p67GK5rD6KIXcbcOM7aOck5gIlCQe4mle1P+8OJU9l51SJhiVvdez+V4I6bp6XeviftlVEg6LLRtmUZMGYklvZ1DmRRfOrySFu7Do0YjrybFEfyVTP2CcjR9olfiPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/iIBXBPmbIH26yoSASp8PS77UuidIXDCzCXbbtbHYA8=;
 b=crcvhmDHs5uI9BYHlZGFVmxf5JGsgWx4G0rcTP7bxtciD9xF0JgNE5uAeiQR6iLx9UlOH23BNoeG7Qu3S5YMsUV4IXIDi77ykEyGbPsxr6Hwxh1hY8+FbflKvisGFd2Ip8qVTLz1P1YWTj1lCfaCF4soZFj/bJ+pOfcjqQnC6bF+NhjZY0awN6ITDJTUimTVBa09zq1iJLVTSHcEgfkvWgIZFBgNk1RKeo9OCG+bNiQcNsXdC5DtjskFRV0dz82WNtn4Xi8G8R9rzF+6jPqgEVJIvfjctfMjp1GR1lOWKJRoeWr0hFwsA7JRdcDpQY9S0cAmVHBAjZbdrDQ87kAbsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6252.namprd11.prod.outlook.com (2603:10b6:a03:457::21)
 by LVUPR11MB9833.namprd11.prod.outlook.com (2603:10b6:408:39d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.9; Wed, 11 Nov
 2026 14:39:22 +0000
Received: from SJ1PR11MB6252.namprd11.prod.outlook.com
 ([fe80::7d3e:3000:9690:1570]) by SJ1PR11MB6252.namprd11.prod.outlook.com
 ([fe80::7d3e:3000:9690:1570%6]) with mapi id 15.21.0615.007; Wed, 11 Nov 2026
 14:39:21 +0000
From: "Otcheretianski, Andrei" <andrei.otcheretianski@intel.com>
To: Shivani Baranwal <shivani.baranwal@oss.qualcomm.com>,
	"johannes@sipsolutions.net" <johannes@sipsolutions.net>
CC: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
	"kavita.kavita@oss.qualcomm.com" <kavita.kavita@oss.qualcomm.com>,
	"vamsin@qti.qualcomm.com" <vamsin@qti.qualcomm.com>
Subject: RE: [PATCH wireless-next v2 16/19] wifi: nl80211/cfg80211: support
 updating an offloaded NAN publish function
Thread-Topic: [PATCH wireless-next v2 16/19] wifi: nl80211/cfg80211: support
 updating an offloaded NAN publish function
Thread-Index: AQHdcNC++lyI9FY0tUSDaXDZXQUnarco3V+A
Date: Wed, 11 Nov 2026 14:39:21 +0000
Message-ID: <SJ1PR11MB62524B844298E7FF76DA8820F5712@SJ1PR11MB6252.namprd11.prod.outlook.com>
References: <20261110043242.2012238-1-shivani.baranwal@oss.qualcomm.com>
 <20261110043242.2012238-17-shivani.baranwal@oss.qualcomm.com>
In-Reply-To: <20261110043242.2012238-17-shivani.baranwal@oss.qualcomm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6252:EE_|LVUPR11MB9833:EE_
x-ms-office365-filtering-correlation-id: afc2b9bc-e849-4e13-ac6b-08df40019308
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|22082099003|18002099003|261009223027099003|261022105027099003|261021135927099003|261021121427099003|261102123227099003|261028144727099003|261026140227099003|261026121527099003|56012099006|10067099003|11063799006|4143699003|5023799004|38070700021;
x-microsoft-antispam-message-info: sJxvDKZLY+z7vt4mqBh56YBxdgAMxY73iuFRvyY7TUI5cg+HcKIMIEYkJpSj1sbcQ5z8G+LelmuuMkvBut6NsXbAh1I/cBAUHwKnI/RHjwg7mIgDxtX6FHl8nUSiLZtblguSrY1eRmXLmqNvmsJmYWAbssFPGF41x7S5yN14q7CFM0yCg9EcK8AmNBKWs9ZsEyDZV52194q1ANM4gu57/0OuGvvRQJUAqn5zx4waU4dDqRJRzFg00TD4JzoZfnzG1R1LfYySHL/1RLROd9HVMMBKRUWe0Abe6StgPYuuTmCg+YotMXfIazm4vABzt/rODp6TT9o3Pmw6ptksCMUqCLYKu1XX/yhDKEUV+eSShCktu+UaUuL1SB6kYvUg3GD55wPfcR+oXyVpDTus0aEj63pU4MT3Xey8dMdl5R/oD5qtISUIbjnP0UDCMktZ01zccxR3R4UI6l4kyYpwbPWIHt14MNlRBo4oydDlZsHNcdXWLyRPH/3U0l0zx3NxvUqSObm8gm9bw1u0GSPX+7XopPWa780/pL1rMU0hjKGevUlTZdEL13py1N2tUt18H1eFleMfpwd+viledwEaCPGE+pydHL9aadDdtMUgou84y5JTBQbQ1j3kJSlS0L8A/5dYniMzkIKEF+Trf4BP0mKj6F8cAOZtTRnxJd+Dna7JYVapKy0mAmZxOAeQPdOLyZC19Fwhrv3EQt4G5ymMx9BDpPhlCWKo/SmqhpAW1pgKop4=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR11MB6252.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(22082099003)(18002099003)(261009223027099003)(261022105027099003)(261021135927099003)(261021121427099003)(261102123227099003)(261028144727099003)(261026140227099003)(261026121527099003)(56012099006)(10067099003)(11063799006)(4143699003)(5023799004)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bTZCUkRHNmFKL2tPQ0FnOSsvMjNPUTJkRmIxd0orSlFQb2dUZmo2bTdVWTdE?=
 =?utf-8?B?OVBHN0ZreHpKU2JMZlMwWDd5ZGJhNGJUaHh1UXJIU01rTVBoc3JKMTE3dU9P?=
 =?utf-8?B?dERmTS9FUzlVLzNsMUI3MThYaUtYMHNnamRKampWcWhQZzlPeUVqSHU5dUQ1?=
 =?utf-8?B?NGJYUnhmaEZybTVYNHF4SjlWUW5UOVFQeWpWTkIyeGJuR1dueHA3RmprdVRO?=
 =?utf-8?B?MEpmdGNmVEpHY3kxak4zVFpxRXAycUw0bDJRSmRRVGhLTTdUSkxmWC92UGFi?=
 =?utf-8?B?VW52cmxRMXc5cmdRNlJuTGsyalBpTmdkS1lrdzZFbG5lR0hBSXlNMDJlMnps?=
 =?utf-8?B?OGd2NjJoa3FtcTZsa1RZWC9ZSU41SmsySEVOQlJhcVdyZTBSTzIzekQydFZP?=
 =?utf-8?B?NzJFb0RKa05JTExkU2JZOEpWa3oyaTEvN1VuVUhONEljQTIvWWp6cG4rWjhX?=
 =?utf-8?B?M3lZTlp1dk9DOTd5Y3lPakpNT0VVSHByMnVrL0tlQ295MFB3VjVoWG9ZYmRE?=
 =?utf-8?B?cVduK0lnWU5hVzdjdGx1OXhrSy8xSEdaTjNoMWl0bmowMU02a2RQbzlJL0E0?=
 =?utf-8?B?b2pnZzluamhjNWJjdjNPNDYxNEFISmNrMFpNQUdsUUxKenlKUFRCdDhEaGxU?=
 =?utf-8?B?Z3JMSjE4NWMzWkgwc05hQTlCSFZQZG9QaHN1S1VhNHhmS1RSVlBmZGsvdzYv?=
 =?utf-8?B?bjc1TXBZMmdrY0pQa3pXQ0lRQ1pzWkMwUDN4TExKbmFwU25vSzQ1TE0rY1RV?=
 =?utf-8?B?R1pBclhXczRpK2c2UFpvSnEvbmNXZnZWVGxIYnNEaGVmQzJEVnMvczA0NEdE?=
 =?utf-8?B?dkxPMURST0hIQnVNNExsMFl4dW1udW1PdTUvbWhrbTBsbFhXSXdDZ2JJdlp0?=
 =?utf-8?B?K2lXMVVCL05oNnRHZ0ZIWU40clREZ2tzSW13WXE3TEtBNzIxenlsV3FuL05q?=
 =?utf-8?B?VHljSWczYnI5ampEWll4blJZNGZrV2RjcmlFcmtLQ2paZ0tXVTl4VUJSQkNi?=
 =?utf-8?B?REhEVWI1Tjdyamd4RXFMN1hsRWFIalJUOVF2Q3cwOC82NUp4MEFhZnpzYkN0?=
 =?utf-8?B?VmhOWEhpbGtFcmdHZm93TkpNWmJ5QTBDRmFJRTlZU0VIenExTWN6Q0JYQ0RR?=
 =?utf-8?B?UisxQm4rVU5NNkNRaUtwaldxeVVxbjdlR28zSEhKUlJaSXl4dlZjQU5RdWpy?=
 =?utf-8?B?ZjliaEF4WTI1SVBNMWpTL2VwYlFOaDlpV1JzRkdlVUgzY0MrWTBvclAzUm1r?=
 =?utf-8?B?Y2ZsK2JoV3pFc1dXeEYrdndSQ3lxS3R6Z3VxMVRwcDRjYWI2VGhVUlVIT213?=
 =?utf-8?B?b0VQTFd2Rm1sQ3ZXTnlkV2MwelZGbnZBZ0JlTlhGbzZMa1U0SU5QdlFKMm5x?=
 =?utf-8?B?cFluZ2pINEpoZVF4VkYzVXRqOVhKU1dianppcjJCaGEwbnZYd3ZlaVMrUXoz?=
 =?utf-8?B?YzVER2xWS2RNcStjdUlqMXZGMWRmUHIrR1BiY2FXNHdIcGRUUzdPYmlaaUJV?=
 =?utf-8?B?SWRpTHZjaVlmSmNmM1lUZkxDVmtvQ3VFZHdSRyswamh2N3JJRXdMV2doVzdW?=
 =?utf-8?B?aFJGaDQwSnB5ZGsxUy9mVHFTSnA5bU5idUpJM29oSlptd0dKa2NsdFFROU1t?=
 =?utf-8?B?WHFic0VLdDZFODNUaE1BeXRFaTlXYWt5MkhBS3Juc1lCVVNiZVBpRGRPUDFF?=
 =?utf-8?B?RlpQVllkMVJWTWJLeVdOSFNLOEVBd0xpeFpNUFIzakRQMzZOYU9HL21zaCtU?=
 =?utf-8?B?SEZzRm5YbTNWUGF1a3lVcnFWeDlJQlJSWW5SSU1wMmpLaGsyN1c4MVJYSEI0?=
 =?utf-8?B?UFBSRG1qSFVxNkpOZDBlR1pEME9MQlhrQ1VmRjlmaUVRbEg1czROU211azlv?=
 =?utf-8?B?Q1Btc2w0bi8vNGprNDB2QndlOUdRMXZCejN2MStHdmVlcHVxLzBpWFlMMDZ3?=
 =?utf-8?B?SkVuWHZoaENxWjBPb1phUlpTL3hvejFvZlBoNXpydGU2U1RVdDJtYlZZeUky?=
 =?utf-8?B?TGFyUVlianRCRnJnMHVscm9weWx4N1RFR1gxNU1aS3hJYi9BWURJak1nVzNQ?=
 =?utf-8?B?cGVkMUFTZkEyL2dTMVVSV2FaandTbnR4eWxhZE5WVlNtQTlKNXR0QVI5WVN4?=
 =?utf-8?B?aTNUaWdQK0pQMElDTmUvVDVzTUZoaFhWSmZiS1dENG1SaGlHNmI3L3BHcW9O?=
 =?utf-8?B?NVREYkZuREUvTFlEeTZla3pTaEFZa2hTcWtBOC83ZklzdDhNY3MzOEIyZXJX?=
 =?utf-8?B?UDNHbHpYUVpBdlNMdnV5SUFJdE1ET2NENDRibFgxSy9icjR1TXBVZElFK3o2?=
 =?utf-8?B?Vkc3cVljUmtZNGNRNE9VUGtXZkRNUWJwNjhWRUpKRkZWRlA3cURJNDZVY1pX?=
 =?utf-8?Q?BZjDc0oXlGagCdJw=3D?=
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
X-Exchange-RoutingPolicyChecked: PKiaO1h3zNAVVsRa/nfqbbOWd3QBMiX1zYO6bbllvhYI/Ci2aiZ1mIJhulo7ODEWenOwxVdzLfjUnUDKxhJc8V54Ae9T68KZUDcWHQvUzp9ZgXIcP5kQCCIOY+W2UiJSgDK8mf/efOTUeRBw9FKF1jUwI4HCp5HKa5Gtk5K2b1lzlaXLxa+pTg4RQVkGrEvKiuemJC7GlnWcMKeLhLgiX4mvOVOjfLekp+KS6/GBQFE+5x2lWAgz7MXvfMl+SRl9fSfEL2d47Vld92uD9ZJyGQo0Ia1rHu6t8W2hM4wEAhQ5DvopMkJD9c361VSZlb//2arKyagbzjZk1Dmz9A7K2Q==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6252.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: afc2b9bc-e849-4e13-ac6b-08df40019308
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Nov 2026 14:39:21.5609
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lBafYZhfPCoqmHOmUo9gjm1hHHUuCQZ7dYFhZ0X8dg1UIEvucl2Tijrxx7whcpCTjaYvjlfe5kzSzgI6J0iXkGpuWwpxvK+BLZq6YrL9a40=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LVUPR11MB9833
X-OriginatorOrg: intel.com

PiBXaXRoIGFuIG9mZmxvYWRlZCBOQU4gRGlzY292ZXJ5IEVuZ2luZSwgdXNlciBzcGFjZSBtYXkg
bmVlZCB0byBjaGFuZ2UgdGhlDQo+IHNlcnZpY2Ugc3BlY2lmaWMgaW5mb3JtYXRpb24gb2YgYW4g
YWN0aXZlIHB1Ymxpc2ggZnVuY3Rpb24uDQo+IA0KPiBBbGxvdyBOTDgwMjExX0NNRF9BRERfTkFO
X0ZVTkNUSU9OIHRvIHVwZGF0ZSBhbiBleGlzdGluZyBwdWJsaXNoDQoNCkkgd291bGQgY29uc2lk
ZXIgYWRkaW5nIGFub3RoZXIgY29tbWFuZCBmb3IgdGhhdC4NCg0KPiBmdW5jdGlvbjogaWYgTkw4
MDIxMV9BVFRSX0NPT0tJRSBpcyBpbmNsdWRlZCwgdGhlIGZ1bmN0aW9uIGlkZW50aWZpZWQgYnkg
dGhlDQo+IGNvb2tpZSBhbmQgYnkgTkw4MDIxMV9OQU5fRlVOQ19JTlNUQU5DRV9JRCBpcyB1cGRh
dGVkIHdpdGggdGhlDQoNCldoeSBib3RoIGNvb2tpZSBhbmQgaW5zdGFuY2VfaWQgYXJlIG5lZWRl
ZD8gQ29va2llIGlzIGVub3VnaCB0byBpZGVudGlmeSB0aGUgTkFOIGZ1bmMuDQoNCj4gY29tcGxl
dGUgZnVuY3Rpb24gZGVmaW5pdGlvbiBmcm9tIHRoZSByZXF1ZXN0LiBjZmc4MDIxMSBrZWVwcyB0
aGUgZ2l2ZW4NCj4gY29va2llIGluc3RlYWQgb2YgYXNzaWduaW5nIGEgbmV3IG9uZSBhbmQgcGFz
c2VzIHRoZSBpbnN0YW5jZSBJRCB0byB0aGUgZHJpdmVyLA0KPiB3aGljaCByZXBsYWNlcyB0aGUg
ZXhpc3RpbmcgZnVuY3Rpb24uIFRoZSByZXBseSBjYXJyaWVzIHRoZSBzYW1lIGNvb2tpZSBhbmQN
Cj4gaW5zdGFuY2UgSUQuDQoNClNvLCBpcyBpdCBjaGFuZ2luZyBhbGwgdGhlIGZpZWxkcyBvciBv
bmx5IFNTST8gVGhlIGZpcnN0IHNlbnRlbmNlIHNheXMgb25seSBTU0kgbmVlZHMgdG8gYmUgdXBk
YXRlZCwgd2hpbGUgdGhlIG5leHQgcGFyYWdyYXBoIGNvbnRyYWRpY3RzIGl0IHNheWluZyB0aGF0
IHRoZSBjb21wbGV0ZSBmdW5jdGlvbiBkZWZpbml0aW9uIGlzIHVwZGF0ZWQuDQpUaGUgc3BlYyBp
biA0LjEuMS4xIG9ubHkgYWxsb3dzIFNTSSB1cGRhdGUgKHNlZSBVcGRhdGVQdWJsaXNoIG1ldGhv
ZCkuDQpJIHBlcnNvbmFsbHkgdGhpbmsgdGhhdCBzb21lIG90aGVyIGZpZWxkcyBzaG91bGQgYmUg
YWxsb3dlZCB0byBiZSB1cGRhdGVkIChtYXliZSBldmVuIGFsbW9zdCBhbGwpLg0KSSB3b3VsZCBi
ZSBjYXJlZnVsIHdpdGggdGhlIFRUTCBmaWVsZCAtIG5lZWRzIHRvIHNwZWNpZnkgd2hldGhlciBp
dCdzIGlnbm9yZWQvcmVzZXQgZXRjLg0KDQo+IEBAIC01MDYsNiArNTA2LDEwIEBAIHN0YXRpYyBp
bnQgaWVlZTgwMjExX2FkZF9uYW5fZnVuYyhzdHJ1Y3Qgd2lwaHkNCj4gKndpcGh5LA0KPiAgCWlm
IChXQVJOX09OKHdpcGh5LT5uYW5fY2FwYS5mbGFncyAmDQo+IFdJUEhZX05BTl9GTEFHU19VU0VS
U1BBQ0VfREUpKQ0KPiAgCQlyZXR1cm4gLUVPUE5PVFNVUFA7DQo+IA0KPiArCS8qIG1hYzgwMjEx
IGFsbG9jYXRlcyB0aGUgaW5zdGFuY2UgSURzIGFuZCBkb2VzIG5vdCBzdXBwb3J0IHVwZGF0ZXMN
Cj4gKi8NCj4gKwlpZiAobmFuX2Z1bmMtPmluc3RhbmNlX2lkKQ0KPiArCQlyZXR1cm4gLUVPUE5P
VFNVUFA7DQo+ICsNCg0KVGhpcyBpcyB3aHkgYSBzZXBhcmF0ZSBjb21tYW5kIHdvdWxkIGJlIGJl
dHRlci4uIEV4aXN0aW5nIGRyaXZlcnMgbWF5IGJlIGNvbmZ1c2VkIHdpdGggdGhlIG5ldyBtZWFu
aW5nIG9mIHRoaXMgaW5zdGFuY2VfaWQgZmllbGQuDQoNCj4gDQo+ICAJZnVuYy0+dHlwZSA9IG5s
YV9nZXRfdTgodGJbTkw4MDIxMV9OQU5fRlVOQ19UWVBFXSk7DQo+IA0KDQpIZXJlIHRoZSBvcmln
aW5hbCBmdW5jdGlvbiB0eXBlIGlzIGJlaW5nIG92ZXJ3cml0dGVuIHdpdGhvdXQgY2hlY2tpbmcg
dGhlIG9yaWdpbmFsIHR5cGUuDQpJIGRvdWJ0IHRoYXQgY2hhbmdpbmcgc3Vic2NyaWJlLT5wdWJs
aXNoIGlzIGEgZGVzaXJlZCBiZWhhdmlvci4uDQpBZ2FpbiAtIHNlcGFyYXRlIGNvbW1hbmQgd291
bGQgc29sdmUgYWxsIHRoaXMuDQoNCkFuZHJlaSANCg0K
