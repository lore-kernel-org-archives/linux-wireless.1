Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.35.83
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795617594;
	b=SlEIfeZ9SLkU1J16+v/lAGP6WU7sGIiuxqtswdVKaXZOssgClu7CztgtH0rFDUrieD71
	 WjnSxP0qJOQDpx9rEoESwvvWbbuN7mOtE9cGaN89pz8XiS42jxG6FL3vzJrud+mWXaXwH
	 aeLihm0a+6adE+Z+KHOT/Esm5bCrh2G3VPR53hgmL4w2wPX2qFhwy8c2csXF+TURkyEV/
	 HPhI9eobmR8io1huck1ozHwRhSfKKygan2GK+cJcvdWGIKEBD7ppkEHTrnXEy7Hu4IlDI
	 7XEyVN9mc7LGDZFuavPOC7q1yUefqJyg642OerB/+f4uSvHMn9BAeJJc9i5UW9iejYg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795617594;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:Date:
	 User-Agent:From:Subject:To:Cc:Content-Language:Autocrypt:Content-Type:
	 Content-Transfer-Encoding:X-ClientProxiedBy:
	 X-Microsoft-Original-Message-ID:MIME-Version:
	 X-MS-Exchange-MessageSentRepresentingType:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=2kxpDYEKN6nQaDnr01yqAT27F/m7LJfHnYkLRByPAwg=;
	b=V12rMtzGtK7Bh5KJxx8eLvwq2zEhNThu609qcl+PueJ6/AeDeuFxuomLcwofD4+twWqA
	 7cr7VX7IUT4L58CrmFvts/Dn13uQP8JORnrj4opvEznXyQB4TAb0A/5rvnvjGKP8dbZEb
	 sLR4pZ+Cs4N+MnZ2RvOk+ExqLUeIbhi/nFmKpA0GzlJRQrEODWQekvM12lPX7SzwlbWR5
	 w2gmfPBWLMqEjRC75YPcIlJnk+ZtdVFSRwQ3NMewmCLWrSa6TNVtmTf92fZGM57kbBrDQ
	 oS9H6FxGqn0NGnzBh+pC3FhL3v6pwSaPVOg0l6393egdPIdPUPGVd8v8VxvXdN+YtgQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=live.de;
	spf=pass smtp.mailfrom=live.de;
	dkim=pass header.d=LIVE.DE header.i=@LIVE.DE header.a=rsa-sha256 header.s=selector1 header.b=r5fWDumh;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.35.83
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazolkn19013083.outbound.protection.outlook.com [52.103.35.83])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02363606A31E
	for <linux-wireless@vger.kernel.org>; Wed, 25 Nov 2026 14:39:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 02363606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=LIVE.DE header.i=@LIVE.DE header.a=rsa-sha256 header.s=selector1 header.b=r5fWDumh
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F9xQSrv7mqzIPzjZNuiztj/4muPaJM72aOzejVoL6XmY2bYnJxSQ0iQpMntasfD2HokvuQzyjR1NCp6LNrkkEc65YJDCuBmq5T8+N7afJQY9VmHQ2Y+HDn9cWDQNlyPGCpubYclHdUarbm4GOQm0uHy6K2hIIFZk+So5TdlWzxuhwzifz2G+qPeMcqJt+VcArIAsyUuYu7MT/K4bGH8h1IG2cgl+z7JRT346/fN3tCrkChFmbfm1iItSrVN0YW+LPwl143HA1N4DlNLFsn7D3r+mvlpY1OEpPYKXt0DOpLNNZv1onCg5tdZixSYD2qVi0O+OGIIcBn+/JEPnnfVk2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2kxpDYEKN6nQaDnr01yqAT27F/m7LJfHnYkLRByPAwg=;
 b=vHhIGgfwqmkOEepqz1vEXj69KeJr2wKNVM14V1jMSg4NvCCEjrj9zdpPqzdS+iFR7hW37Y6XwlHA3DiJx9vMGSBIAP2Ja3yisqnNKhOWqSKAmOV8XSrbq3nwER0YZ4ALtxxBdLKkPD48un5tCOb94hwa1kLMygqLzG90LpjHH0S1avi2ckyGtOaphlEynsWabMCzgmo1DvZi9a2cjFe1wuc/YLt5KORwa7J5Qbn2KGBDuy5dJoRS92x/7NM6A+c8jqioCf7eGEpK3Wi0wEAvG9vHKNHwJP4NSwmabNwWvk4zVmdjstMlRTM6eI8JxJqtKo16H85DlCMce2KVyu+dIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=LIVE.DE; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2kxpDYEKN6nQaDnr01yqAT27F/m7LJfHnYkLRByPAwg=;
 b=r5fWDumhT74kD3pumKbtnxZoGJ2GeWn5V120nos+hS51sighCxf6BiFUhqfh6MXkgEFUdUkdY1Bf639l4LDXtzk/9w1pFXoXlTKBVeSd0MWTlA4AJoS3FKox7f8joTybByOANzvWg17LFoVs3bK0KsxJzDwj2H3tmOe+umgMm7iVgxXr1HbNd8eWqhavjolcOOukGWmHNQpFEfBAhpPeiGeE9OoHewHPioC3JeB166sy4SS8QNtFIGsSkzWYUYn7iIR2a4gS3P6qXyHiXBnbSAEmNhJOdoV2WYO0muZDESWy5kW8nouuvrqxPS9aqJS2d/fjj1AD5BsJifAueOIOuA==
Received: from GV2PR08MB9208.eurprd08.prod.outlook.com (2603:10a6:150:dc::14)
 by DBBPR08MB10602.eurprd08.prod.outlook.com (2603:10a6:10:52c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.5; Wed, 25 Nov
 2026 14:39:48 +0000
Received: from GV2PR08MB9208.eurprd08.prod.outlook.com
 ([fe80::4728:ba8d:79f1:2f2d]) by GV2PR08MB9208.eurprd08.prod.outlook.com
 ([fe80::4728:ba8d:79f1:2f2d%4]) with mapi id 15.21.0662.004; Wed, 25 Nov 2026
 14:39:48 +0000
Message-ID:
 <GV2PR08MB920863010A8B69228FF49AFE91432@GV2PR08MB9208.eurprd08.prod.outlook.com>
Date: Wed, 25 Nov 2026 15:39:46 +0100
User-Agent: Mozilla Thunderbird
From: "m.vanderwijden@live.de" <m.vanderwijden@live.de>
Subject: [PATCH wireless-next v2 2/2] wifi: cfg80211: only parse multi-link
 probe responses on MLO bands
To: linux-wireless@vger.kernel.org
Cc: johannes@sipsolutions.net, benjamin.berg@intel.com,
 miriam.rachel.korenblit@intel.com,
 Lachlan Hodges <lachlan.hodges@morsemicro.com>
Content-Language: en-US
Autocrypt: addr=m.vanderwijden@live.de; keydata=
 xjMEawIisRYJKwYBBAHaRw8BAQdAhSt8XBoKcVuzaN2I1VFbR8o03wLSBTtprzeKdDTLLmLN
 L20udmFuZGVyd2lqZGVuQGxpdmUuZGUgPG0udmFuZGVyd2lqZGVuQGxpdmUuZGU+wo8EExYI
 ADcWIQTMEyts92CDKwC/+p7K40LVK7aRSQUCawIisQUJBaOagAIbAwQLCQgHBRUICQoLBRYC
 AwEAAAoJEMrjQtUrtpFJIFUA/AkdYmKA15B26VPa6XNZInO25k1iDmlw9nGUfrMeq9IsAP9y
 JvMBlSzBrOsPOO3IUma8dXlqXvZVpl6W7D3KPAX5Cc44BGsCIrESCisGAQQBl1UBBQEBB0Dm
 fcqAiSmFwZxMqLGOinFMo7z03kaO/ksCvCiQK5p2NgMBCAfCfgQYFggAJhYhBMwTK2z3YIMr
 AL/6nsrjQtUrtpFJBQJrAiKxBQkFo5qAAhsMAAoJEMrjQtUrtpFJQn0BALNFi/S3m+kqFQqh
 fQg3VAWd3GzjgxGnIM8JoLG7RY/aAP9dRyTomx1sZDi1LJTRGqOfT2Kd5sU2iAPsEBA5wZfE Cg==
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0178.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a0::19) To GV2PR08MB9208.eurprd08.prod.outlook.com
 (2603:10a6:150:dc::14)
X-Microsoft-Original-Message-ID:
 <543ae702-07fe-476d-877f-8e2ca6e5d160@live.de>
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR08MB9208:EE_|DBBPR08MB10602:EE_
X-MS-Office365-Filtering-Correlation-Id: e11f2f8e-24fc-40c2-536d-08df4b01f4ae
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|8060799015|19110799012|55001999006|25010399006|24021099003|15080799012|25031999004|6090799003|5062599005|23021999003|51005399006|5072599009|40105399003|56899033|440099028|3412199025;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZjhNUWgxaldlQTNuMUprT0JUWmdvZ2pmWjZyckZrVDRLV1VPcEtMR0lmRVpp?=
 =?utf-8?B?eEdMUmhYNURxZEsweWMvKzdnQUtEc2RodTZ2ekJ5T2l3SE8wQ25XK2hQVzhZ?=
 =?utf-8?B?NkdDQzZON2ZyNHNLVm9NcTNOZVUrZkV6QThmOGswL05HaEtoY3M2MzF2d2ZE?=
 =?utf-8?B?VXEvZ2lkYittRVBQaCthemJlVUh0Z083UVpqNjdTbWpmdENENlJLVllIY1FB?=
 =?utf-8?B?QWxWNUp1R2lEVHYvMzRxSFJrOXZwSElJUnorcjd5MVVkMTdPcDhFM3FveEI2?=
 =?utf-8?B?R2p0Y0crYnhtd05SNHJNMDJDZ2ZKSDQ4T3RreFZ3N3V3dGViM0FabUt1eDVS?=
 =?utf-8?B?VnptenBEQi9CaUxRRCtjWmFPb28wUkhNQnJNRVFOUlRwRmNwR3J5QWNndFZS?=
 =?utf-8?B?TWZTRVphaVZ5Tks2VFlqdlRZdHdUaUpobWwwRCsxYk4rT1VPVnIzRjRIREZ2?=
 =?utf-8?B?bHo0MmY2SnFXMDNZOTJVaEpqRllPcnNCSVVDUi9aL01GS3BiMkFneVY2R1Yr?=
 =?utf-8?B?S2ZGL3RyVEFwS1pUZUVHZk5qNjU3bEVRKzFCZXBKNmdwZTFCQ3lmWVhyU0NV?=
 =?utf-8?B?OXF2NDVjMmhZamwwNnhHaGE5MFNCSmxUc090RktZNGgvT01sYk1LSFVXa2pt?=
 =?utf-8?B?Y3dGaEo4SUIvNE1icEFxd0t0cTN6enN1OVRvMXRLQ2JWdzRRK2F0N0xjaXhB?=
 =?utf-8?B?Q1V6byswNmxPU3VwWXZOREtiSzd1b1FOSEtvenVGdUlPNjhhZGZVaTdzelpV?=
 =?utf-8?B?RW5LcDM4UHU4ZFZoSnoyQWlaZ1plWjZCNjJjbkRiNzBvdGNFZFZUbmhHVERD?=
 =?utf-8?B?d2RhdWtXVm9neDRCOElkaDlVL0oxV2JjaFhxb25ya3VzYXlyWGpsRHRGT01M?=
 =?utf-8?B?ekZCL24xd1d1YkpBMDJDUm50bFdOWkdQK0x5dVVkaUlGbE5jNEJRei9YMlI4?=
 =?utf-8?B?MUowbVBDc2RpNzNZUENMUndodXB6YXRuWDM2eTl6UURQMUN6VlloTHpMWnJx?=
 =?utf-8?B?VmpXbTJTN3B2R3lKZDhJLzVKME5KM2QydlU1ejc3bFNXUEJ4M05kY0tQbFVR?=
 =?utf-8?B?RTNvcWVpaXc0WGVIbFJmamFKUXNVcG9RNVRmb1Q5U21IZjNmZjhyZlBza09s?=
 =?utf-8?B?RFRyUUNGNXcrcnFXVXc3SnNVeGs0a3B3WWo5WWdRc01HSkd2Z3FtZmw1Yk9J?=
 =?utf-8?B?eExtU0JvSXl2Nzc1N1EyTFErc0JHTlZPUE1MTDFWVVRhQlJVNURWV0l3dVFM?=
 =?utf-8?B?Q0E4aFZKYnZleWtuOE51WE5mMVlXc2pWaEcrZnJNRDlleEcxVzdTS0FiRVdx?=
 =?utf-8?B?OW1nSGNoYmEvY1FIeGdVMXR4dTAxNnpYVXV1SlhjWmtEZk1GMmhtRWdQTTFX?=
 =?utf-8?B?cE5mZXJOYWsvQjJjQisrVVVYYmkzZ2pnLzlLUlNSL1JHekRNQ3pmOFZOVHVv?=
 =?utf-8?Q?AX6d/VVg?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SGpQM2MyUGx2a24rOEcxR01hbXFObHA5THNGMlIxRzlWcWx1ZkdUZi8xWUJH?=
 =?utf-8?B?YlhHL1VMWW1BTmxpdGhONFhOZVZNN1g5bW1WU01vV2dQWGRLS3VRL3RKM0ly?=
 =?utf-8?B?RDRvZkphMHRHeWw3OG1lNzdvZk4yNzFlSU5ORXA5RDBscHFseWpMMVBsWE9D?=
 =?utf-8?B?TXFtVjBoN0VRbkpuekxjL3VsYTJIbXh0Yml2QUkwUUd5VHFtNmMyY1ZJbnU0?=
 =?utf-8?B?WWhLRFdSZWZHc1ozYmUxa2x5U0IzZDlneFlyYi84bHdKSmkrRTcrRWFFYWVX?=
 =?utf-8?B?QUgvQ1h4VlF5azJRdzQzVlFUQUFJK08xaUxDSkxkNC80MlRZd2p5YmZSdVZ6?=
 =?utf-8?B?M0U3QmdwdVNSOXRoa0FnZDZOTnRyN1hpa05IZW85bGNDL1VIMVlaeis5WTFl?=
 =?utf-8?B?bjVzakFidVNjZCtWVjc4U28xYmpjQ3pMZ1lOTExVY015dXgrdmlYNno5RnQ4?=
 =?utf-8?B?cFZMbFlmU2pnc0U5TkMrTmlnQ2VnSnEycW1oSmhLbURpdCtjOW1OT0NoT2RH?=
 =?utf-8?B?RG9lZ0hyMDZ5YlowcW9Zd2tEVTVrUCtKZmhIZi9pSmZ5MTlDdFVIRHc5eDRa?=
 =?utf-8?B?bnVOQ3FRMVArbHF1MmNFWFFxaGhHRlRZUDhTL0U3c2xYRThScFBjc3Nkc2FC?=
 =?utf-8?B?bUZ0d1NpcmNVYURKV3djZkd1cGJjd3cyeG1GYjVwbnFwRHFZTXNoMzg5a0xF?=
 =?utf-8?B?MWtCZk5heThWelFBV1VjNXVTKzI3b1VXb1pIUml1ekZ2amJtdndEeTM3Qk95?=
 =?utf-8?B?TmYwbmE2a2c0T1huWTRFQUxLY0NZWUdSam4zOHh6dTF5WTBCeXpMWUZUM1Rm?=
 =?utf-8?B?bTF6N0RUTVRkWDI5ek5iZSsrQ0hrTm42aW1lL3g0QmYyM1BQM2tvMkcvRldL?=
 =?utf-8?B?K3orSnJRMC93QVpGbXV1NFB1Si8xWjE1cnA4K1U3SEtZS2F5TDRQeHgzcXBh?=
 =?utf-8?B?ekpmaWl6OE9qKzRidStyOHhuQ3UyQnVFWlpwbUNHc3M0Y3ZoQW1yZDc3YUxM?=
 =?utf-8?B?YkZiZGJreFJDTkYrT0c1LzdMVDVnZFhkaXF6eER2bXJWWkNZbzVrbFpTUHpQ?=
 =?utf-8?B?bDB0TWNIZkNVeUdyMnpwRCtTT0E1a1E5bko2MDJnMWppOTlBLzg0Yk1RYnBq?=
 =?utf-8?B?am4yVlNXUER6TkdxVmp2K3dHMlRSOHpKWEFXR1NkTDBiV1ZQM2ZhTldZSTkz?=
 =?utf-8?B?VEJKT1VNSmFkb090TDJZWkdtYzBYM3VtazA4TkRsNm51czE3RHNwM1FrVmNa?=
 =?utf-8?B?aFhkT3hkTGJYT3JrM0hTQi9EcXB2NnZYOTVjM0xtQ3RUTkk1a0E2RmliTGpP?=
 =?utf-8?B?Y0lLWlExaFlhRTJ4Z3YrZHhZbzVNanAwSzI4OWhXZmVFQnFMQUhGWGx4aDZh?=
 =?utf-8?B?UmNEM3FLa05IWEQxMjVHb09lazFCQ2lua0ptUjFpWFdUM3FBVU1ia0VuNmRS?=
 =?utf-8?B?K2p5UGQwVEtiUnM5cGI2MUxjd2RSckNWVklKR1FOalN1cDE4ditRdEF4RllU?=
 =?utf-8?B?b3VmVzJIYys4WXNIaHVBRzZSTjNkelA1T2dkV29JanVDYm8xSEU5WTl3Z21z?=
 =?utf-8?B?a2dQY1o4bDA4RktISno0TVN0U3ZNVXVZakhwcTdwTDcrMnpkL0tSM2F6ZC9k?=
 =?utf-8?B?M1dGcjF1a1ZSV242UHlNVGN4NENGdHlFUmtudXprR1kvbUk3aGVhb2hGMHps?=
 =?utf-8?B?WlpTeFVHVzFVdjdXR1Qzbnc1RUFaa0NOczRlWFlYOE9lQ3JtUzNHSWZ1emEz?=
 =?utf-8?B?WXp3N3kwUTBQbkgyOEtmZERGaFNQYzB1R21SbVNoR0NMd2xwSWhVU0JZZEhI?=
 =?utf-8?B?aDNEOGdHcVlSK1lZcXN0VWJ5cy9nV21UWHNIZ3UxSnA2UThlSTYxYVo5Vjg3?=
 =?utf-8?B?TFlIY0IzU0Q0Q2lWMEdNN1pWcW9hRWJBTzJLdmpiSzl0NlljbU56QzhRQXpH?=
 =?utf-8?Q?4zYCsiCfhNNC9Gpn8OeiXcqyBVvTV7Bf?=
X-OriginatorOrg: sct-15-20-9412-4-msonline-outlook-fbb9b.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: e11f2f8e-24fc-40c2-536d-08df4b01f4ae
X-MS-Exchange-CrossTenant-AuthSource: GV2PR08MB9208.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 14:39:48.5614
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB10602

Add a 60 GHz and an S1G channel to the test wiphy, and a KUnit test
that informs a multi-link probe response (MLD ID 0, one per-STA
profile, no Supported Operating Classes element) on each of them. It
must not trigger a warning or create a BSS entry for the other link.

Without the previous patch, each frame triggers the WARN_ON in
cfg80211_chandef_create().

An AI coding assistant was used to write this test.

Signed-off-by: MariusVanDerWijden <m.vanderwijden@live.de>
---
Changes in v2:
- Target wireless-next instead of wireless. No changes to this patch.

 net/wireless/tests/scan.c | 99 +++++++++++++++++++++++++++++++++++++++
 net/wireless/tests/util.c | 10 ++++
 net/wireless/tests/util.h | 17 +++++++
 3 files changed, 126 insertions(+)

diff --git a/net/wireless/tests/scan.c b/net/wireless/tests/scan.c
index 8c20278b5d3a..0681f2c8eff5 100644
--- a/net/wireless/tests/scan.c
+++ b/net/wireless/tests/scan.c
@@ -790,6 +790,104 @@ static void test_inform_bss_ml_sta(struct kunit *test)
 	cfg80211_put_bss(wiphy, link_bss);
 }
 
+static const struct inform_bss_ml_band_case {
+	const char *desc;
+	u32 freq_khz;
+} inform_bss_ml_band_cases[] = {
+	{ .desc = "60ghz", .freq_khz = MHZ_TO_KHZ(60480), },
+	{ .desc = "s1ghz", .freq_khz = 902500, },
+};
+KUNIT_ARRAY_PARAM_DESC(inform_bss_ml_band, inform_bss_ml_band_cases, desc)
+
+/*
+ * A multi-link probe response received on a band without multi-link
+ * operation must neither warn nor create BSS entries for the other links.
+ */
+static void test_inform_bss_ml_sta_band(struct kunit *test)
+{
+	const struct inform_bss_ml_band_case *params = test->param_value;
+	struct inform_bss ctx = {
+		.test = test,
+	};
+	struct wiphy *wiphy = T_WIPHY(test, ctx);
+	struct cfg80211_inform_bss inform_bss = {
+		.signal = 50,
+		.drv_data = &ctx,
+	};
+	const u8 bssid[ETH_ALEN] = { 0x10, 0x22, 0x33, 0x44, 0x55, 0x66 };
+	const u8 link_bssid[ETH_ALEN] = { 0x10, 0x22, 0x33, 0x44, 0x55, 0x67 };
+	struct sk_buff *input = kunit_zalloc_skb(test, 256, GFP_KERNEL);
+	struct {
+		__le16 control;
+		u8 var_len;
+		u8 mld_mac_addr[ETH_ALEN];
+		u8 link_id_info;
+		u8 params_change_count;
+		__le16 mld_caps_and_ops;
+	} __packed mle_basic_common_info = {
+		.control =
+			cpu_to_le16(IEEE80211_ML_CONTROL_TYPE_BASIC |
+				    IEEE80211_MLC_BASIC_PRES_BSS_PARAM_CH_CNT |
+				    IEEE80211_MLC_BASIC_PRES_LINK_ID |
+				    IEEE80211_MLC_BASIC_PRES_MLD_CAPA_OP),
+		.var_len = sizeof(mle_basic_common_info) - 2,
+		.mld_mac_addr = { 0x10, 0x22, 0x33, 0x44, 0x55, 0x60 },
+	};
+	struct {
+		__le16 control;
+		u8 var_len;
+		u8 bssid[ETH_ALEN];
+		__le16 capabilities;
+	} __packed sta_prof = {
+		.control =
+			cpu_to_le16(IEEE80211_MLE_STA_CONTROL_COMPLETE_PROFILE |
+				    IEEE80211_MLE_STA_CONTROL_STA_MAC_ADDR_PRESENT |
+				    u16_encode_bits(2,
+						    IEEE80211_MLE_STA_CONTROL_LINK_ID)),
+		.var_len = 1 + ETH_ALEN,
+		.capabilities = cpu_to_le16(0x1234),
+	};
+	struct cfg80211_bss *bss = NULL;
+
+	KUNIT_ASSERT_NOT_NULL(test, input);
+	memcpy(sta_prof.bssid, link_bssid, ETH_ALEN);
+
+	inform_bss.chan = ieee80211_get_channel_khz(wiphy, params->freq_khz);
+	KUNIT_ASSERT_NOT_NULL(test, inform_bss.chan);
+
+	skb_put_u8(input, WLAN_EID_SSID);
+	skb_put_u8(input, 4);
+	skb_put_data(input, "TEST", 4);
+
+	/* no Supported Operating Classes element, MLD ID 0 */
+	skb_put_u8(input, WLAN_EID_EXTENSION);
+	skb_put_u8(input, 1 + sizeof(mle_basic_common_info) + 2 +
+			  sizeof(sta_prof));
+	skb_put_u8(input, WLAN_EID_EXT_EHT_MULTI_LINK);
+	skb_put_data(input, &mle_basic_common_info,
+		     sizeof(mle_basic_common_info));
+	skb_put_u8(input, IEEE80211_MLE_SUBELEM_PER_STA_PROFILE);
+	skb_put_u8(input, sizeof(sta_prof));
+	skb_put_data(input, &sta_prof, sizeof(sta_prof));
+
+	kunit_warning_suppress(test) {
+		bss = cfg80211_inform_bss_data(wiphy, &inform_bss,
+					       CFG80211_BSS_FTYPE_PRESP,
+					       bssid, 0, 0x1234, 100,
+					       input->data, input->len,
+					       GFP_KERNEL);
+		KUNIT_EXPECT_SUPPRESSED_WARNING_COUNT(test, 0);
+	}
+	KUNIT_EXPECT_NOT_NULL(test, bss);
+	KUNIT_EXPECT_NULL(test, __cfg80211_get_bss(wiphy, NULL, link_bssid,
+						   NULL, 0,
+						   IEEE80211_BSS_TYPE_ANY,
+						   IEEE80211_PRIVACY_ANY,
+						   0, NULL));
+
+	cfg80211_put_bss(wiphy, bss);
+}
+
 static struct cfg80211_parse_colocated_ap_case {
 	const char *desc;
 	u8 op_class;
@@ -972,6 +1070,7 @@ static struct kunit_suite gen_new_ie = {
 kunit_test_suite(gen_new_ie);
 
 static struct kunit_case inform_bss_test_cases[] = {
+	KUNIT_CASE_PARAM(test_inform_bss_ml_sta_band, inform_bss_ml_band_gen_params),
 	KUNIT_CASE(test_inform_bss_ssid_only),
 	KUNIT_CASE(test_get_bss_miss_reason),
 	KUNIT_CASE_PARAM(test_inform_bss_ml_sta, inform_bss_ml_sta_gen_params),
diff --git a/net/wireless/tests/util.c b/net/wireless/tests/util.c
index 118f7fb4226d..850898e9f2d4 100644
--- a/net/wireless/tests/util.c
+++ b/net/wireless/tests/util.c
@@ -33,6 +33,16 @@ int t_wiphy_init(struct kunit_resource *resource, void *ctx)
 	priv->band_2ghz.channels = priv->channels_2ghz;
 	priv->band_2ghz.n_channels = ARRAY_SIZE(channels_2ghz);
 
+	memcpy(priv->channels_60ghz, channels_60ghz, sizeof(channels_60ghz));
+	wiphy->bands[NL80211_BAND_60GHZ] = &priv->band_60ghz;
+	priv->band_60ghz.channels = priv->channels_60ghz;
+	priv->band_60ghz.n_channels = ARRAY_SIZE(channels_60ghz);
+
+	memcpy(priv->channels_s1ghz, channels_s1ghz, sizeof(channels_s1ghz));
+	wiphy->bands[NL80211_BAND_S1GHZ] = &priv->band_s1ghz;
+	priv->band_s1ghz.channels = priv->channels_s1ghz;
+	priv->band_s1ghz.n_channels = ARRAY_SIZE(channels_s1ghz);
+
 	resource->data = wiphy;
 	resource->name = "wiphy";
 
diff --git a/net/wireless/tests/util.h b/net/wireless/tests/util.h
index 6de712e0d432..fc058534df28 100644
--- a/net/wireless/tests/util.h
+++ b/net/wireless/tests/util.h
@@ -30,6 +30,19 @@ static const struct ieee80211_channel channels_2ghz[] = {
 	CHAN2G(2484), /* Channel 14 */
 };
 
+static const struct ieee80211_channel channels_60ghz[] = {
+	{ .band = NL80211_BAND_60GHZ, .center_freq = 60480, .hw_value = 2 },
+};
+
+static const struct ieee80211_channel channels_s1ghz[] = {
+	{
+		.band = NL80211_BAND_S1GHZ,
+		.center_freq = 902,
+		.freq_offset = 500,
+		.hw_value = 1,
+	},
+};
+
 struct t_wiphy_priv {
 	struct kunit *test;
 	struct cfg80211_ops *ops;
@@ -38,6 +51,10 @@ struct t_wiphy_priv {
 
 	struct ieee80211_supported_band band_2ghz;
 	struct ieee80211_channel channels_2ghz[ARRAY_SIZE(channels_2ghz)];
+	struct ieee80211_supported_band band_60ghz;
+	struct ieee80211_channel channels_60ghz[ARRAY_SIZE(channels_60ghz)];
+	struct ieee80211_supported_band band_s1ghz;
+	struct ieee80211_channel channels_s1ghz[ARRAY_SIZE(channels_s1ghz)];
 };
 
 #define T_WIPHY(test, ctx) ({						\
-- 
2.56.0

