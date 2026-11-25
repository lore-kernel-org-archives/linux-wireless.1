Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.33.7
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795566229;
	b=B2SLmli3GNcu2cx5l+O3Bm0uw1/dfQYpqeCJ0ZNNanKcj8wz3bE52nh/3Oglh6SGXXJz
	 Y/kb77qAUO362zTqxFpqK2HsQ2Z7wwCloKNLclh9EGrd8MMCCSbuI33+N1I/j/l23RGOJ
	 geGUS4wFaOW5RJBKOZEF5cCd/4HMqdwn36LYvfJAQ2d6JAPdSZ5Mv1RSV6q/lGj/TRkJ8
	 1isaYx0oRc8gbWoGGp7Sp63NA02bTh4kviamxR6u1saAuFcbg00AKE58mBPxvvdYKK3PJ
	 7aT3h38Onbg7a7mJo5j8KP3MqyuIM/GWLK3gHlADPkUh0czpDqhuV0r6r3fgPcVO0Jw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795566229;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:Date:
	 User-Agent:Content-Language:To:Cc:From:Subject:Autocrypt:Content-Type:
	 Content-Transfer-Encoding:X-ClientProxiedBy:
	 X-Microsoft-Original-Message-ID:MIME-Version:
	 X-MS-Exchange-MessageSentRepresentingType:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SLBlob-MailProps:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=Xiv7+83aAeGZGMOXTCPsrZnb93hpaqJlwydGAJ/oiPs=;
	b=lnQDQBTIN1Hc6cRR3kmhqlJmPA9SS/hjxkmfH8tpSLHsgR2zUocSgGPK5iZVS4tA7DAY
	 H1gLP0wJQDptM0SlEWi8JG+d5hRSEB1ZwIRlqI5s4lwyZgQUv0LxMvbhJVtzcQ/rIeJpu
	 0OkBlRhlef+oiAeayFE0jiMeUp9lFBotzW0R18WHD5BOefFEMccNYFM9v3M/tt54LK60F
	 o+Acps7bjl/qfoDLJhiWoyaWJrKZIWgS1D3Df/BDZKN0aMHy5ooWNvtPuyHFP2c1geC2+
	 VxB0kWLTQYDrF/MWlZqPongMN42VUjbXuy1EC6hGxVpFnvrhRCIFf7nxpaYEak7qE6Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=live.de;
	spf=pass smtp.mailfrom=live.de;
	dkim=pass header.d=LIVE.DE header.i=@LIVE.DE header.a=rsa-sha256 header.s=selector1 header.b=hMlOSr5v;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.33.7
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazolkn19010007.outbound.protection.outlook.com [52.103.33.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED5CE606A31E
	for <linux-wireless@vger.kernel.org>; Wed, 25 Nov 2026 00:23:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ED5CE606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=LIVE.DE header.i=@LIVE.DE header.a=rsa-sha256 header.s=selector1 header.b=hMlOSr5v
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZLzbMA94HijyfR//9MCJnMg/CTVDJ2RonngUYTZ1T20LIQ4qBYn9s3R1VkOS/XU8ZhsPVEI4MHMQhMZze7YRmtpWpCr9JapPlecbuaUKuMjAVCmXv+UqxBc4ZdWlxGEmEiIONdNaJuvl/3Et+nN2ffv74uoY6roIuB2Nn5+lq+BK3X363gGp+QuR48EailPAm7z6mX+UHnNmXT6h6gv12RKM2FcvHwNpHx4za9wHkNdxMlRNx3Fpai0QvbjUpH7KHRqmjkuP3HqZlYzIjPXcAkVtQHijnPi9u2VcaLmhqjZZhBkzEFgK7EN7YftS47z+Q/dEepXfU8J834S6LKVPlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xiv7+83aAeGZGMOXTCPsrZnb93hpaqJlwydGAJ/oiPs=;
 b=Y4DpwSZjlPvHKcVnEkyvjiehbAAywp20M3PznwJAU/YWoXUI4B+h09q+EqyA9Nj8kJSvnkKFf5pkvvxlupyxrgs00jy1Ea1htnHpT23DLI3loOrG2k40LALuIZfqhoih14gRkEmA7NyGkV0wPLLvoQpGr9ccEVw3G9woomuTKE80MLoXx5wWJz8pdW+2W7b+YAAK7hjVRN/+/oDUrpQIkYlKfvw7XD/eidmA4wnojOAjk36SPDqeJgDo513ROgKgbZfuwDWtHqk1KyzaJCQ3FCX+05SINySEFPqz+3Yq1VYzBov+PWuYICKpYxml9q9xUR8GR4NeIPdiCFYKffRcbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=LIVE.DE; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xiv7+83aAeGZGMOXTCPsrZnb93hpaqJlwydGAJ/oiPs=;
 b=hMlOSr5v2FyU4hBJMNnZjM9568ijmpfq4aYSgIMyMPUXW+FDzeAaj+hfw3u6IikrPKa7x8n9D/X0Wsw0hanxNDaj/RRvwMrqo32bRQB56RkEtvJnansrCv2+7YmZ8vm6kH9GUZ9g/V8RUimzlOl4nG79WXHBQ0p6FChx5tPqFmcMfoIUlyp4F8HZz8FvTc6Tg5DWVZzUvLpbCVhkh/kzcAJwv5xy1rhQU9G87yuqdkB/LUibJeF/6yWcvKTMdxABNDL9SC5GSSIZliuIJhH0uoIevOjHzM1cUAFlvife7SLFnMeqcUL9RVNxK3BJWuk1mT5vRuNic6prNeUH7DznNA==
Received: from DB4PR08MB9189.eurprd08.prod.outlook.com (2603:10a6:10:3fe::21)
 by DBBPR08MB6089.eurprd08.prod.outlook.com (2603:10a6:10:206::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.13; Wed, 25 Nov
 2026 00:23:40 +0000
Received: from DB4PR08MB9189.eurprd08.prod.outlook.com
 ([fe80::6079:7a17:a636:4420]) by DB4PR08MB9189.eurprd08.prod.outlook.com
 ([fe80::6079:7a17:a636:4420%4]) with mapi id 15.21.0639.012; Wed, 25 Nov 2026
 00:23:40 +0000
Message-ID:
 <DB4PR08MB918981BAAB6C18C678F5594191432@DB4PR08MB9189.eurprd08.prod.outlook.com>
Date: Wed, 25 Nov 2026 01:23:38 +0100
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: linux-wireless@vger.kernel.org
Cc: johannes@sipsolutions.net, sara.sharon@intel.com
From: "m.vanderwijden@live.de" <m.vanderwijden@live.de>
Subject: [PATCH wireless 1/2] wifi: cfg80211: fix BSS reference leaks with,
 hidden SSID and MBSSID
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
X-ClientProxiedBy: FR4P281CA0425.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:d1::12) To DB4PR08MB9189.eurprd08.prod.outlook.com
 (2603:10a6:10:3fe::21)
X-Microsoft-Original-Message-ID:
 <04a86b1e-2362-4b50-9e34-fbc3b6f70c97@live.de>
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
X-MS-TrafficTypeDiagnostic: DB4PR08MB9189:EE_|DBBPR08MB6089:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d9aa4cd-8ea7-4997-4337-08df4a8a5aa2
X-MS-Exchange-SLBlob-MailProps:
	xgbIMsDSu2bc7yhuK2afLsfZGs5LbJY28kZjeV/VXsFDcyBh+kNUDm4xCh0xNc7EbaFc8/I6FkcV8HIzFcn0TNLrT+866iZDJ5xFR52jBDiw9H54QZlpoGytxNcs0taoblvAYhQf2UVXNJHmlXX4xwQTmHwrmSBFPDQc9OTJXcsWNFyCRNNZfh0K2cO4KNWuxxD6efebvPBucXuK8wwoPJFvFWJ1o2MbFK0JF1YzoS1X9H/+qmNKiSQuiSLqvvxXBoXvvhEE8DujU9aX67hHvSbiksJPObiQWPalSyYNt6FN7DkP816GxqzBQMGwACr11j9uPSQIXk7+KSwJHsoMnRkAU5ZoGi3e59oKd8AlDKmkKWCgyX+HnQdMXMHg0DbCIuO/cl6/2Tx888jxrecU3/AcgTdyDkbNrL5b80vRVnfWNl0fYttxh2sp6ntafsEfzmIQbu4h9c4X/UXYiCZY/mVNXLlkiMVGWQfJMm0WacDmb9k0zwvvrucuY5Hbfvn1vkty0gDXEj2Bir9LJZktbAHfwTTgI4kumST0VGaKcMFLJ9r0WiUIbwmSqJq4IT1GWjqYqVSx0f+Qpc/crJwcrzFtLHbHhfVxzEp0vu3N28m7UT8vMFbabDgcO87AwfE0VX9TTqsRXhMTXi5shoKrxS0VrEoj4b2hIkhtB0bKUhHPXNveWDsMG2UmeaHpvJ693eouklj+reHeyxcBlPWlm2skuxxCOwH+j2ZaktPRpbNveMnYI01++w1Le4KpRz0lqvqwVisyfYNwy2BXSOYTMvw/VxMxugDd
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|5072599009|15080799012|8060799015|41001999006|19110799012|23021999003|25031999004|6090799003|24071999003|20031999006|5062599005|24021099003|4140399003|39105399006|25010399006|440099028|3412199025|12091999003|40105399003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bnQxRm1rQUkvTnVkMXRGUHgwVi9CazM5TUJuQ3VwL2xoSjV5VG5SUS96aW5U?=
 =?utf-8?B?Z3d4Y3pxeWN6amR1QjNQK1dZVTR5UXYzUm9DTnlzOVNzYkNncVVSOEFEam96?=
 =?utf-8?B?WGRxcC9aUWRmeXNoMERKU1RPVVB1N1ZUelN1UWxiZ3JUemJmWXVQZWxTNlhh?=
 =?utf-8?B?VTFwN0lxOHFHaE1LakJRZHI5a05mMTM3N1J6THIxY2tqRndId3NUVXlYMXg1?=
 =?utf-8?B?d2RKSDZrMkhNUmFjUzNRWWFHU1lONUt5a3lvcVQ0NG0wUHZqOUViOStCOFNM?=
 =?utf-8?B?eGZuWDh3SEdCbXBQdzMzTWI0RzAycnVjL0ZCc2g0YWN3VU9lUmxrWlJ4WEZY?=
 =?utf-8?B?QldxME5yOG5iUTlwa0hqZTM3Wm1rRU0rVU5tVHhFTDE5VjFmRGJHa09SeVlC?=
 =?utf-8?B?cXAxTW42MU44ZUhBM0dSTjJkSTRJNGhQcGlwNHdHNUJQd3BYaHlJWklYWmVH?=
 =?utf-8?B?eDc3amtFaDVreHptL3dJbThlSUkwU2pBb0ZhaEx2SllLdE5Td3JpMytYeEVC?=
 =?utf-8?B?Q1BhSktiWiszb0lBWGxnY2w4UnZhbVQ4VUVkNUpHODdIQUJMYjkyNktjUS9B?=
 =?utf-8?B?SmJFWVlsd1p5dzl1Z2ZkRFpGVDhNZ1cyYXQvY3UvWEUzSFVuSkkzTnZ3ZjVH?=
 =?utf-8?B?L1cvNXVNNXlZZUd5Y2F5MnRRaFk2QmxHd3RPV2p3NVR2azFHSlhPaVFOdVBp?=
 =?utf-8?B?Y0lDdFJ5TjFPb2hrZHYvZ2RJODFlNG9PVUhlSmNjTmRnUlZxejFRYUVGekl1?=
 =?utf-8?B?dG83NWlpVnJsbmsvanR3S2t4YjRDZ25UZXVHcjNsK25NQU51ZXQ3RElYM3FR?=
 =?utf-8?B?Z0NUV1ZSM0lGbGtSdksvY2Y1NHNxWHB1OXY3SkthcHJCempyaHFXOG9JTUVR?=
 =?utf-8?B?MDhxeWh0aTVrclVIUm9DeWE1Unc5Vlhpc2FZM0ljeTRqRUZiNnpIaC81OXJx?=
 =?utf-8?B?VThyMmEvMU16citoc0pPOFJCcVZwVklmdTMza1g5bVh4c1I2K2ZhNDh2ejU3?=
 =?utf-8?B?bDBmVXNNRFBtbDRYNFRPUndjMEFqZzZKVTZuT1dqUTY2NzFPTFVoZHNTWEpO?=
 =?utf-8?B?N2FhbzdYNkRoc2xoaU5RN1FHdENXQWVMUWZMZUZadk5yU2ZIVUhMUGNGWFd4?=
 =?utf-8?B?ZWo0U1pna1ZzdGFOdjNENHhiUXVQbDRJQlQrejROaHNSZmNrU1hHRjlUa1N0?=
 =?utf-8?B?S2xWY2RqRVFEN1lQaDBCZ1FVOXBJaXNibUVrTEl5Q2hhUnQvOEw2cFdUTWdv?=
 =?utf-8?B?Nk9mT1ZubXhRSmxLcnFBanV1MnNnRHUzZDcyZW5MU2p4SHRHcnZ4R0ljTVVo?=
 =?utf-8?B?Q1dQUlJ6a2hMblRnOWxrUlprMVVCc3d3bUMwSmJzdkFLVnVjd080TlJ0VHFH?=
 =?utf-8?B?ZG52NWVSRXhEMzNmc2RZdnRqdHE5NVZHMzNOTjc0VDREYjQvVzdWbGJOS21C?=
 =?utf-8?B?d0ZhUnowcTJFUi9GczJ5VE9WTFBJOENEbDZBRWo2cmZjS1NOMlJXVDZmUUFo?=
 =?utf-8?B?dEJXYmhIZmdFcGFmTGNPaW5SalVkNGRmR0JjZ0k5eXBHTHE1enZPdVp3Tkhw?=
 =?utf-8?B?VUV3UT09?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TFJUUnJhejJOS1h2NWpoOUJqT1p2RDFzR25CRkc2UGRTajd4SG9jRDdNekxN?=
 =?utf-8?B?ZFpMbEx1RVBubW9JdlBLdEZpdTdqNUM4cjUvZk05QTdabXZaVmxDVmIyZWRt?=
 =?utf-8?B?YjN3TWpkQjJoZzRZTXhqcFU3Vm50OGJWOENmbkw0QUZ3ZEFYc01sOGZ4NGpa?=
 =?utf-8?B?b2JtczdrbW4ycEkyNjQrTFpMWmttM0Iwd1ZMV1hTZkFjWHk4YzJmTC94bG5v?=
 =?utf-8?B?WHJwaDMrY2tMajd2NnZtWWNLVjUrM0VOOHFNU21lYmI2dDJOWjNmWXBIbENT?=
 =?utf-8?B?M0hKSk5OelJ6L3FLemR1UC9tbk1HNVFqR0YxekhUcXpvZWFZamdFMEFhRjR6?=
 =?utf-8?B?MzErZTdKWkVLb05yWUEzK2lWc0JmcUt5cVRFRU4zQU5XNHIvbkdLelZGS01Y?=
 =?utf-8?B?UC9PNWhXbkNHTzQ5VmJlei9EV3VGcFBkNFE3d3grYzZod2tMdnU3cXF2N2h5?=
 =?utf-8?B?STZUNXVpcTh4VDZ5S0VieEF2Vyt2Mk0waFYvdlJnNTY4TjNwR3ZOZ3A4VEZG?=
 =?utf-8?B?eWFSOGt4TWJ5MEpYQUFveEV5Y3BBa2dRTHdWeXJCMlZ5VlhSczBXakUxSk11?=
 =?utf-8?B?ZmhZeW9xZUNrWTN0ZEVYSUFKNWgwb29jUWxmNHY3VnI3aVpqTzdJQnQzdFpB?=
 =?utf-8?B?YmRPck5NeVV3YjVYQWlIMnh6NXk0d0xQazNoQmlaVkJkOTRtUDl5bzhXbE51?=
 =?utf-8?B?VmloWTlzZU5qVm1ndHQxV2htbzJic2htME40TnJlaVVYTzNYZ0Q0SWh2dHdC?=
 =?utf-8?B?Y0VKaU9TcG42YzFRZzRDOWtzSll4QXJ0QTlVdG9ycEk2TmFIUEY5cmdLWWJ3?=
 =?utf-8?B?U3lJTGw1TW9SM0FsR2NoVkVtUDI4NGZreFdVRU1Pb2ZOdzlteDgvV0V2WkJH?=
 =?utf-8?B?UFlYUGpaWmJxdkh1cHROdXB3cE9sdVYrbHF4TEtlMG5IWU5DZW80MGU0cUdC?=
 =?utf-8?B?TytuYlpXcnBvMEJuUGVsTVVudWxaUVdKVU13QzVLMFpMNEZVc3U0a3I4TUFQ?=
 =?utf-8?B?aGJ5NEpCbSthUXgyeGpwM0dsQ0FJaFBCcEdsYVBoeW1WZ2Q3MDRvWk1RL01r?=
 =?utf-8?B?U25iUDVNNk1KMjZzTGwrWjhiVHRQRHF3UDVuUE1zRFVsMzJROWtLRm5HUlc1?=
 =?utf-8?B?Y1hRcG9PSTRNRlBFcGVkMjVkR1pVMy85WC9QV2JvdE12OXhuK1JkQWV3ZmEr?=
 =?utf-8?B?OUVEa28vK2NJSlh0MURsRU16YmJXY1BMNWpZMkd6c0tSWHUzWmJXVFowRVEr?=
 =?utf-8?B?U1RPc0UwN1h4dkFPMGRZLyt5OWlBSWVQTXByWVVwMTVBVmR2MlIxaEE0Y2M1?=
 =?utf-8?B?VzdqeWhqcStWbFdra0Q4K09ZZWhrWHhDQmlsRXpneFJ1c2MxdTFPQmtjeVph?=
 =?utf-8?B?OHhzQ0hNaXgrMVFtUld2bXkvYVdkMW9HaG9XaUlTekhINm1BNHZwdzhiRWtD?=
 =?utf-8?B?K1BrMnhtbXYxUUlxNzhQSTUxTkNDaUdLT3VLbDhNQURHcG03WDhVNFJUajZL?=
 =?utf-8?B?TmdtMy83VFl3MUhCamRwVDd6M2pXNWFTbnNsZWxqb2Y5MXVsdmt0RDBBV0JL?=
 =?utf-8?B?R1F5UGpaTHdmUXQ2SHU1RGVlT1MwK3FDVG84NmsrOUwwVHhQekNVZjliK1dO?=
 =?utf-8?B?NU5iN2hxbFZXc1czckozRERtb3l2UHB1eDl5SFRTQXQ5Qk9KR3V4bmE1dGhq?=
 =?utf-8?B?M3ArK2VlUzQ5YUhhTS85eGxFY3ZScjhQUjg3Nk52RjFNUTZEbW9heEYvMUVR?=
 =?utf-8?B?OUJ3OGxFTFMrT3g0YWV0dlZLMlAvaGc4U0h4VDVWR2ZUenBpVGUzcUxrNnRJ?=
 =?utf-8?B?TC9oT2Urb29uU1Z0WWhxV0RGbkRTMmJONENsWUIvc2hnaDhBMmgzN013Y3Q1?=
 =?utf-8?B?TmNBa05BRjlETzNzd3JhMCtWNnN4dy9GUE81cUJDWC9QMkJaTzdHRVMvU3A1?=
 =?utf-8?Q?zJjAYsksMwlHDkW07jRlWL7aaT6W5daM?=
X-OriginatorOrg: sct-15-20-9412-4-msonline-outlook-fbb9b.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d9aa4cd-8ea7-4997-4337-08df4a8a5aa2
X-MS-Exchange-CrossTenant-AuthSource: DB4PR08MB9189.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 00:23:39.9562
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6089

BSS entries point to other entries through hidden_beacon_bss (a probe
response entry to the hidden-SSID beacon entry it is grouped with) and
transmitted_bss (a nontransmitted BSS to its transmitting BSS). Each
get or put on an entry is also applied to the entries it points to,
one level deep, so that those stay alive while it is in use.

With multi-BSSID these links can be chained: a nontransmitted BSS
points to its transmitting BSS, which can itself be a probe response
entry grouped with a hidden-SSID beacon entry. One level of
propagation doesn't cover that, and the two places that create such a
chain count it inconsistently:

 - __cfg80211_bss_update() takes the reference for a new
   nontransmitted BSS with bss_ref_get() on the transmitting BSS,
   which also increments the beacon entry, but putting the new entry
   only decrements the transmitting BSS.

 - cfg80211_combine_bsses() adds the whole refcount of a probe
   response entry to the beacon entry it is grouped with. If the probe
   response entry already has nontransmitted BSSes, that count
   includes the references they propagated to it, which they later
   drop only on the probe response entry.

Either way the beacon entry keeps a reference that is never dropped,
and once it expires it is never freed. A station scanning near an AP
that hides its SSID in beacons but sends a Multiple BSSID element in
probe responses leaks such an entry each time it expires; spoofed
frames can repeat this.

Taking a single reference in the first case would stop that leak, but
then the beacon entry can be freed while the transmitting BSS, kept
alive by a nontransmitted BSS that is still in use, points to it and
shares its beacon IEs.

Instead, give each entry exactly one reference on each entry it points
to, and drop it only when the pointing entry is freed. Getting or
putting an entry then no longer touches other entries, chains of any
length are covered, and an entry can't be freed while another entry
still points to it. Freeing an entry can now free the entries it
points to in turn, so do that iteratively rather than recursively.

The leak was found with a userspace fuzz harness around
cfg80211_inform_bss_*() whose oracle checks BSS refcounts against the
table's links. An AI coding assistant was used to analyse the
finding and to draft this patch and changelog.

Fixes: a3584f56de1c ("cfg80211: Properly track transmitting and non-transmitting BSS")
Cc: stable@vger.kernel.org
Signed-off-by: MariusVanDerWijden <m.vanderwijden@live.de>
---
Notes (not part of the commit message):

- Testing: KUnit on ARCH=um (all cfg80211 suites), with the tests from
  patch 2/2, on master 8d7fe9885c62:

                         leak test         leak test        held nontx
                         beacon first      presp first      BSS test
    master               refcount 2        refcount 2       pass
    this patch           pass              pass             pass

  With this patch all 61 cfg80211 KUnit tests pass, with and without
  CONFIG_KASAN=y, and KASAN reports nothing. Not tested on hardware or
  with mac80211_hwsim.

- Since get and put no longer follow links, entries that pointed to
  each other in a cycle would simply never be freed rather than cause
  a loop. I haven't checked whether received frames can create such a
  cycle.

 net/wireless/scan.c | 76 ++++++++++++++++++++++++---------------------
 1 file changed, 41 insertions(+), 35 deletions(-)

diff --git a/net/wireless/scan.c b/net/wireless/scan.c
index 1c50a16c0e9b..0a978f5d4a10 100644
--- a/net/wireless/scan.c
+++ b/net/wireless/scan.c
@@ -44,13 +44,13 @@
  * beacon's information.
  *
  * Reference counting is done for all these references except for
- * the hidden_list, so that a beacon BSS struct that is otherwise
- * not referenced has one reference for being on the bss_list and
- * one for each probe response entry that points to it using the
- * hidden_beacon_bss pointer. When a BSS struct that has such a
- * pointer is get/put, the refcount update is also propagated to
- * the referenced struct, this ensure that it cannot get removed
- * while somebody is using the probe response version.
+ * the hidden_list, so that a BSS struct that is otherwise not
+ * referenced has one reference for being on the bss_list and one
+ * for each entry that points to it using the hidden_beacon_bss or
+ * transmitted_bss pointer. Those references are only dropped when
+ * the pointing entry is freed, which ensures that a referenced
+ * struct cannot get removed while any entry pointing to it, e.g.
+ * the probe response version, still exists.
  *
  * Note that the hidden_beacon_bss pointer never changes, due to
  * the reference counting. Therefore, no locking is needed for
@@ -107,40 +107,47 @@ static inline void bss_ref_get(struct cfg80211_registered_device *rdev,
 	lockdep_assert_held(&rdev->bss_lock);
 
 	bss->refcount++;
-
-	if (bss->pub.hidden_beacon_bss)
-		bss_from_pub(bss->pub.hidden_beacon_bss)->refcount++;
-
-	if (bss->pub.transmitted_bss)
-		bss_from_pub(bss->pub.transmitted_bss)->refcount++;
 }
 
-static inline void bss_ref_put(struct cfg80211_registered_device *rdev,
-			       struct cfg80211_internal_bss *bss)
+static void bss_put_link(struct cfg80211_bss *pub, struct list_head *free_list)
 {
-	lockdep_assert_held(&rdev->bss_lock);
+	struct cfg80211_internal_bss *bss;
 
-	if (bss->pub.hidden_beacon_bss) {
-		struct cfg80211_internal_bss *hbss;
+	if (!pub)
+		return;
 
-		hbss = bss_from_pub(bss->pub.hidden_beacon_bss);
-		hbss->refcount--;
-		if (hbss->refcount == 0)
-			bss_free(hbss);
-	}
+	bss = bss_from_pub(pub);
+	if (--bss->refcount == 0)
+		list_add_tail(&bss->list, free_list);
+}
 
-	if (bss->pub.transmitted_bss) {
-		struct cfg80211_internal_bss *tbss;
+static void bss_ref_put(struct cfg80211_registered_device *rdev,
+			struct cfg80211_internal_bss *bss)
+{
+	LIST_HEAD(free_list);
 
-		tbss = bss_from_pub(bss->pub.transmitted_bss);
-		tbss->refcount--;
-		if (tbss->refcount == 0)
-			bss_free(tbss);
-	}
+	lockdep_assert_held(&rdev->bss_lock);
+
+	if (--bss->refcount)
+		return;
 
-	bss->refcount--;
-	if (bss->refcount == 0)
+	/*
+	 * Freeing an entry drops the references it holds on the entries
+	 * it points to, which may free those in turn. Use the list member
+	 * to do this without recursion: an entry whose last reference is
+	 * gone is no longer on the bss_list, other than when the whole
+	 * list is torn down in cfg80211_dev_free(), and an entry still on
+	 * the bss_list always holds its own reference for being there.
+	 */
+	list_add_tail(&bss->list, &free_list);
+	while (!list_empty(&free_list)) {
+		bss = list_first_entry(&free_list, struct cfg80211_internal_bss,
+				       list);
+		list_del(&bss->list);
+		bss_put_link(bss->pub.hidden_beacon_bss, &free_list);
+		bss_put_link(bss->pub.transmitted_bss, &free_list);
 		bss_free(bss);
+	}
 }
 
 static bool __cfg80211_unlink_bss(struct cfg80211_registered_device *rdev,
@@ -1855,7 +1862,7 @@ static bool cfg80211_combine_bsses(struct cfg80211_registered_device *rdev,
 		/* combine them */
 		list_add(&bss->hidden_list, &new->hidden_list);
 		bss->pub.hidden_beacon_bss = &new->pub;
-		new->refcount += bss->refcount;
+		new->refcount++;
 		rcu_assign_pointer(bss->pub.beacon_ies,
 				   new->pub.beacon_ies);
 	}
@@ -2118,10 +2125,9 @@ __cfg80211_bss_update(struct cfg80211_registered_device *rdev,
 			return NULL;
 		}
 
-		/* This must be before the call to bss_ref_get */
 		if (tmp->pub.transmitted_bss) {
 			new->pub.transmitted_bss = tmp->pub.transmitted_bss;
-			bss_ref_get(rdev, bss_from_pub(tmp->pub.transmitted_bss));
+			bss_from_pub(tmp->pub.transmitted_bss)->refcount++;
 		}
 
 		cfg80211_insert_bss(rdev, new);
-- 
2.56.0

