Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.184.10
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794310049;
	b=sYS0dX+DcIjAidbHS42iK5p/ipWEyepSqQw9xfs9BiSi+RPyXn+57uoPxz56Qp2SM1pW
	 tFe/UnFWa7tOWwMyIJ8EILnMspnf2yDhpRtM76JFD8V1qs4dsDWqU/Kr9BaBFyfqQ+izl
	 WXGbuAydaf8XA7kwBaUoPahIpdU97Ujr1KjQoeKIvZQ0OIsq6vZPqjtcyhLLwmdJXxMdy
	 4zg7BUMzCT7XiV4NsBNjS2vLk/JBleW5Gn3i7PPwhnVgi0Iwho8ZZlbW2L1DD13oEoo/C
	 F4UYlatf2EDoz/60kQhazrG+tCO3TbMvQZ/KwgUJa4tWvg2eG9Qo+01Z1k9RfwW/nug==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794310049;
	h=DMARC-Filter:Received:DKIM-Signature:Received:DKIM-Signature:
	 Received:Received:From:Date:Subject:Content-Type:
	 Content-Transfer-Encoding:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:
	 X-Mailer:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-Exchange-RoutingPolicyChecked:
	 X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:
	 X-MS-Exchange-CrossPremises-AuthSource:
	 X-MS-Exchange-CrossPremises-AuthAs:
	 X-MS-Exchange-CrossPremises-AuthMechanism:
	 X-MS-Exchange-CrossPremises-Mapi-Admin-Submission:
	 X-MS-Exchange-CrossPremises-MessageSource:
	 X-MS-Exchange-CrossPremises-BCC:
	 X-MS-Exchange-CrossPremises-OriginalClientIPAddress:
	 X-MS-Exchange-CrossPremises-TransportTrafficType:
	 X-MS-Exchange-CrossPremises-Antispam-ScanContext:
	 X-MS-Exchange-CrossPremises-SCL:
	 X-MS-Exchange-CrossPremises-Processed-By-Journaling:
	 X-OrganizationHeadersPreserved:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis;
	bh=el6IfzS1I6ulaCwBjkoSN1W9yg4lPhSzBOEYeX9uHus=;
	b=0to7T3NCWYBGGa3cY7SnbA1JU74qXym9OrxxH3K16+d+1Ga63x+qmPizKpHsvTpD2A9I
	 gZgdBe6EZ+QTK9FfeOqnR8zEiT+QmOOwH06ifW9wEL63Xb+kLcib/+3vns7Xrzmfpj1wm
	 adaA61OBpZhejB5xNjw7JoOlva/e7DJ6Tg0WY1bG/OwUlU70O+wOfZ+y4a0sf5Fu7S7yp
	 jgbBkvGMi7Fwn/fY+s7y5MdD/3qbFaA5pzG0L5hbaNNHMV3GMHRlgbMYweQ81phl8d7Pw
	 e5Rah35Y+AobLEGSC/U4l4j2jRmw50uEwyr8Ng3iNphU2tnFPnMOIM4Y82aoXj7/qgw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=westermo.com;
	spf=pass smtp.mailfrom=westermo.com;
	dkim=pass header.d=westermo.com header.i=@westermo.com header.a=rsa-sha256 header.s=270620241 header.b=efkqTkjC;
	dkim=pass header.d=beijerelectronicsab.onmicrosoft.com header.i=@beijerelectronicsab.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-beijerelectronicsab-onmicrosoft-com header.b=J9mjA5b7;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.184.10
Received: from mx07-0057a101.pphosted.com (mx07-0057a101.pphosted.com [205.220.184.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F3A3606A31C
	for <linux-wireless@vger.kernel.org>; Tue, 10 Nov 2026 11:27:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F3A3606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=westermo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=westermo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=westermo.com header.i=@westermo.com header.a=rsa-sha256 header.s=270620241 header.b=efkqTkjC;
	dkim=pass (1024-bit key, unprotected) header.d=beijerelectronicsab.onmicrosoft.com header.i=@beijerelectronicsab.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-beijerelectronicsab-onmicrosoft-com header.b=J9mjA5b7
Received: from pps.filterd (m0214197.ppops.net [127.0.0.1])
	by mx07-0057a101.pphosted.com (8.18.1.12/8.18.1.12) with ESMTP id 6AA4RSuK3684004;
	Tue, 10 Nov 2026 12:27:19 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=westermo.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=270620241; bh=el6IfzS1I6ulaCwBjkoSN1
	W9yg4lPhSzBOEYeX9uHus=; b=efkqTkjCCjk6PZvcV8Z5/q4lsZ1Ez16ITpkQ0B
	p8uFNQ1KmwjLjNy8sx7EgPMT/j2UI5VtLDdIxfJeFDDeoSvptc88WB20XGT/fryQ
	TIxDr2NGnW5KTVHURMfZ+F/3b65tbrR4lwSBfHiOF8lpcmvT0yNLwgNLAh3G6/5R
	zI4IvaL7L6ldh7ViV4QyBx3LL35suVtfUsIrY3u46LQwUt6WR5Csu9VsoZu+/rcL
	FmvHvQn6PqI0ZdesqZ/SqyNqaHfL8c99G+Qm6gqILKAHJJdaMQQcRRInO4THJmEN
	TvClhgoWnXGVWnD98Le6EtyrTV9VN7Zv5EQvVdyycYrtXmrA==
Received: from db3pr0202cu003.outbound.protection.outlook.com (mail-northeuropeazon11020100.outbound.protection.outlook.com [52.101.84.100])
	by mx07-0057a101.pphosted.com (PPS) with ESMTPS id 4hstbdkc65-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT key_exchange=secp256r1);
	Tue, 10 Nov 2026 12:27:19 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q88l5wOqlE7hAWS/Hirq2e+/Ue3ysDnyYbOj/rv2WH+TdNNjy9Lx12maxgFZDgS91AoNRpYCu0pvzqX9lU8Qr5zzqFsebCGU0+MYRot/TaJh63Xb/TqnP98I9nV4JwsYkY57i0RqwiYG0BMrggRtNq1Ds4z5KXm6ayvO3mKcwP/4oC2HBgY+qW92Iaa1WGme5pQC7O5wD3Kv4/3x4TFV/Eat9YznJs9bzpiQzc0ubHOFoyO+h6Tm2BqcGbGbrmNlvGH3KvVHh6PnYQjBVZRktFwWS4ZB2ht29rBPoI2eerAwm3G5Yken2ngr08kN3BWPe6boXMS//+Ises5wadjgpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=el6IfzS1I6ulaCwBjkoSN1W9yg4lPhSzBOEYeX9uHus=;
 b=bu+LpRMMS3XdkIFlQUN9RjYFI34I5lVDQxCyMHhnJg/lTJ8xG1T6AmLtVbzxRKaAb1/bBU3EsZdn70sr5dToB5Jkz2OO1k6rvtBlp4qafzdViLqyw5yDkyddh2KFVruJYkStu1JNuXC+M6garaB9RAsDsR4JGr1QcPLLpzCq/2tCRpiAcs5R2VgS5jp6Z7uhlQPRNhXIWYHLJ4Dp96iwSyxGDmHMx/+k5y8wust41PapZN8fj7/l8TibfQreBmgleCK7kJpRFDJBEn69qXaGxK9vxm3L/ogiQpOGpxSHiASNXIGUdY+6wPmSLd2SJcJj7QfrJMGyVQ5pNd0iiDeb0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=westermo.com; dmarc=pass action=none header.from=westermo.com;
 dkim=pass header.d=westermo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=beijerelectronicsab.onmicrosoft.com;
 s=selector1-beijerelectronicsab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=el6IfzS1I6ulaCwBjkoSN1W9yg4lPhSzBOEYeX9uHus=;
 b=J9mjA5b7j4UKDXZAkNpUVgZSquFtm6q64wBC2hPl8gSjr/ZyC+4CTSz8cn6Ot1b4zdXPnYIbuyzfXyel1yZHw6pnjqH65482coRIWTqr1Fv5MrGcgR3MZLLxPcv9NUlIuF0Swwm6NBioRdG7oSIILepsSh3YvMgbzUL4yHR0z8Q=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=westermo.com;
Received: from DB9P192MB3090.EURP192.PROD.OUTLOOK.COM (2603:10a6:10:5e2::11)
 by GV1P192MB2705.EURP192.PROD.OUTLOOK.COM (2603:10a6:150:25e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Tue, 10 Nov
 2026 11:27:16 +0000
Received: from DB9P192MB3090.EURP192.PROD.OUTLOOK.COM
 ([fe80::656d:42d4:bdce:a46b]) by DB9P192MB3090.EURP192.PROD.OUTLOOK.COM
 ([fe80::656d:42d4:bdce:a46b%6]) with mapi id 15.21.0592.012; Tue, 10 Nov 2026
 11:27:16 +0000
From: Alexander Wilhelm <alexander.wilhelm@westermo.com>
Date: Tue, 10 Nov 2026 12:27:14 +0100
Subject: [PATCH] iw: interface: fix MLO link ID on big endian
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261110-mlo-link-id-v1-1-ae83736e28e2@westermo.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2MQQqAIBAAvxJ7bkE9eOgr0cG2tZZMQyEC8e9Jx
 xmYqVA4CxeYhgqZHymSYgc9DkCHizujbJ3BKGO11gqvkDBIPLtHUoacp9WSstCLO7OX97/NS2s
 fWzXI+F0AAAA=
X-Change-ID: 20261110-mlo-link-id-c02cafcb6c06
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org
X-Mailer: b4 0.14.3
X-ClientProxiedBy: GV3PEPF0003BF3E.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:401::62d) To DB9P192MB3090.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:10:5e2::11)
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9P192MB3090:EE_|GV1P192MB2705:EE_
X-MS-Office365-Filtering-Correlation-Id: f6b3fbf7-effc-4bf7-4636-08df3f1d9349
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|18002099003|10067099003|56012099006|11063799006|261102123227099003|261009223027099003|261021123027099003|261021121427099003|261026121527099003;
X-Microsoft-Antispam-Message-Info:
	EI2Ex2L1kfVTZDpQKK6tGD2XXvGV8/gBfs3McVUqacKYft0FMlTxQTJyt7Sdgm8v24jVx40+2wc2wnI4UW+6dBY8bPqU1W05NjvBPDX4t+cyUsERbaL8DNJUwuyNEfnyUflb7KffwGC1mp0lt+R4VYhcgqJbI+NRvV1xqCoq+csIp0W4g7/85GSTHHSIX6EPySdh85WS+/nK0sxOtxua6r6Fvq77Uc0wa0I1fprxjCggNz30Ct0Kl9F4WelA+z6luSiiX18qB7fF4Fp7b/Ph8PPCw3rv0TobbbmdVcDvEOqzyWQzpU+ZPd7M1h8BMrQqyaINRzl/0VlOe310K25uSGozJKMxipi0FcAM6jvEV0FYcKYy6wc6OWAjpuhTTPGstxYRenkNvHjMMbYdZMeVm0oXNxpFTl84PUZManDYODMTebHZo0MRgoKqr0zPLzjU2eJwkzD+gCcsuCgAaIei9Icg934RTOC2mjrXx/mQyNBbt3rqDqATgnFESP7yqLWTu3P4XXtY11b3TsN7lyGmfUi+qgSZXp68JokLaIZudSjYLTO+c0QgjkGl3L7pXRkCE00x5S3ER550a5cgjnyjeCuo12tLO4PLQ9eQzsI/g6H9NzXFGsAJaxBSvRxW1M/a3IJSnxSmIO/eZGZ+e5kbEQ/FadbYx+PfoGBsoEX0nDQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9P192MB3090.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(18002099003)(10067099003)(56012099006)(11063799006)(261102123227099003)(261009223027099003)(261021123027099003)(261021121427099003)(261026121527099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RVlRY1QydmJncy9xRklJSG5lWm9STVJLUzJNNC9zb2NZNG0yNjY3V3dtZHYx?=
 =?utf-8?B?OVhqVy80UVB6R3lYZGZMcHVNWnZhWFJ3cjkybUhKYlMzNEo1RE5RRlNFdlVH?=
 =?utf-8?B?eElYbG9tUTJIK2Nyd3ZGbis3TURUUWFNbjFOMGtyYlQ3SFd5WDAzWXJZYzB3?=
 =?utf-8?B?V3ZMVFAvV0VqQUdGcGJBd3lMcktHOTBjSzg0TGZuazRsZTFkbWkxWHNwNjRr?=
 =?utf-8?B?R3RPM0g2QlhQVTFqajhqaVd5SHJiM3EwYVVuc01BZWdCRUxyOThobUx0K0o3?=
 =?utf-8?B?NlpBOFdialBsVGhkZ3hubHA1ZWhVZ3NKaVJVZnYxYTVaR2Y1VU1zYWowdDZx?=
 =?utf-8?B?R1h3bTVwbzcrRWlNSVNqYjhwUktMOGlRa0NMY2FlV1NPakR2Tjk5aTFHb2Ix?=
 =?utf-8?B?UC9VODBBMGRFYmtKcGZBQmFaQzlndmRpUW9CTVBUYnRueTVDVVd2Q2M1d3lR?=
 =?utf-8?B?eFl0c1d1WFpHMkd4bENNUVZFWmVHT1J6WDY5TmxCUGhEZFNVMklWSHNvSmtv?=
 =?utf-8?B?NXd5Vk4xTUtNcnJ0MXVjRnYrVEQ4K3NEbGNyUkZqazdnTVlZVmpWdU9hOFhJ?=
 =?utf-8?B?c25HdGRPaGZWclRxNFlYckhTOTJINThEQXVIWE96aFpMOTliMGM2cVQ1SnFL?=
 =?utf-8?B?dG1EZHhaVU9oMXpTRFR2aFZmN2J0bjM2YktuNWE4bkltYi9JaUNmUFlmMk1N?=
 =?utf-8?B?WXlzaGdiMTN2Q1ZLd1E1N1R1T3l1Qk9VREZMYnUvT3lOZDJCTFgvSUZYVXEy?=
 =?utf-8?B?RG5HbG9GNXZtdnhDYnJwTDFUVmdUbUUwc2szNjNVNEZkYllFNHNMUlR3ZUNE?=
 =?utf-8?B?Z1U2RE5LaklWTE4rRnc5QlBwTUlVb3lLWHl1Nm4yaFBQREwxcy9HL3NUdGJF?=
 =?utf-8?B?ZFRLcjNvNE9ITmw0dHdwdHkwbVhwN0hDSFBPaklKUCtmcE1sckZCb3VEdENC?=
 =?utf-8?B?eW1BL25KWDlGRitKZzJOblFKTzBJaXVnTE9VZUdkZTNTbzJldEJCd05TUFUw?=
 =?utf-8?B?RGpLeTRYZ2JYbUg0TXVRYXI1V3AwOGpQdkFoNmJmaDA2VFU4RVExZGFLRElE?=
 =?utf-8?B?dmJIU1Vrc1VsRHdVYVZvbWMxQ2hyTmJPa0NRaTJOWEhuMjhFVnphV2YxNVBv?=
 =?utf-8?B?by9HVkNRc09PRUtMRkZrYWJyZ3RiK1B4d25JZFp6aWgwN1ByVXk0ZjhDaXYy?=
 =?utf-8?B?czVNdjlRbCsvc1BVdUFTaERoMnBWRTdacjlaNzdBbGdlNmwyUmczbDZWZHZF?=
 =?utf-8?B?amppeFJ0ZnhCWThNNkJlaCtyVE4zRytkMmwwODBWaVV2bStTMGowcktKb24r?=
 =?utf-8?B?bVRlREFRNzJRODRaMFpvRnd4VkJnZTFjeWNTYjRFbkp5dkRvZVlrY0RvMTFM?=
 =?utf-8?B?aXVXT3dGZEg5MU04RGFEdmNWMkVnR0V3NkRtNkdSa2R0M2NUVi83QTNMZXJn?=
 =?utf-8?B?b1MzT0ZXQndJT09VYW1DbWZmVU5SNVRsenJlTksyQ0ExdjN5RHRNNElkWk1C?=
 =?utf-8?B?M3F3bkM0WFpYeGdVMjA4RmJwbGoweUh6MWVjNUhRQjBKZVN5V0xsMG5INWlq?=
 =?utf-8?B?QkxpUmxFSkFnTkdlU01pSVEwd2l1YjFOQURQL1o1d1YxNDMxWDVpMXJGeVFt?=
 =?utf-8?B?NzZublVwN09xQkNmY1R6UW04TDJaVW1xQWtob1NabjBISGVsejJBUG9UUFBH?=
 =?utf-8?B?alljREdINytRekNTR0RnMEJJZFBIYW9pZXVNbjR2bjB0OU5TNW0xM1dpRVZk?=
 =?utf-8?B?ZEhKV0Fqd0l6OXppMHlGZXgwV1FEVVVTZno5Z2xPbDdzYjNXZVgxdW5SM1B0?=
 =?utf-8?B?MnJwNEZEeU1hSzYvRk5tNlFqUUlXWmUzbkI3WHdMbFJTeUs4RnpYdmRWRGYr?=
 =?utf-8?B?WXNFSzNvamYzNmx4ZlVub0l5MG5ac0tsZzYwcjYxOGFTOGh5VmpqNjRaRE94?=
 =?utf-8?B?eVBHRWFDbXBVYTQzZXlRRXNNVHdMckNjOUVCeTkvVTlWT3VJYytMR011YjVy?=
 =?utf-8?B?U2tiRG5MQ3lzekVuUG1VTzNjT3VOb25HczI5S0s0Q0NrMnYwVndKWjJzSmda?=
 =?utf-8?B?QUZkU0Zkc0xPQ1JvYjVXdnBJbm1sQ2dsSk0yZ3FWeE5kNzNMeEpCVGg4MkFQ?=
 =?utf-8?B?QW5BVWtMRXhzY1ArOUdjTmlKNlUwTkRSMmlTa2UxdDBnUkVlVEVDWVdIZTVB?=
 =?utf-8?B?QW05eTBXUDN5clN1MW5jZHJZN2xMeWcxYXFHOUNaR2JDeS9NOENWUXZESTJI?=
 =?utf-8?B?elVTUHVnazQwMjlTZGdseUxKL3pScFJNZGFCZHdkbENRdGZ5Q3FyRUlqOGhz?=
 =?utf-8?B?b0F3YitCUko5SVVBMW9rODNJZzBWakVOT3dLU1NaV2x1c2Z4YWpIdz09?=
X-Exchange-RoutingPolicyChecked:
	tfgVffXXy+GIQROWNg2dqXxE43t7t0TYzXi6JyGMvkPHVsj/cms9WDs+YZNx2/nBvTjgncqDthEqi7nijonM7NpWxDulS/MZxS8QOF6PB+8TpO2FFO0QotImtHi8Kz70JKmRd80nzcgge4tf0WnZHLmcoXlNeedF4mxJnoj5RYy3t9xEdz0kG7G4jOEC2VeA4bStxrBLgwmbzNrn1h0+rWqfKhWxGquXzgDurLisRgWquaEM/1rIq78xr029twzd8myBSeW2aFqiUBl+en9bV1xDVpnuV9WTjv4vI6FM99cZEnvg1ipniOd2Fd7hNE0zUmVSy5QxyScoqmyXOMuJKQ==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Y5469Nd1P7SwAv24AxD1aFDdTga144b1mGcZsA77EKWbVBIc4/+JPt98gHzuS+i7JRbeMSguHuyIWYOwM040XnrNgcreCAqN8MJT7C8pUxBdKRX2efq/R2V8k0xCB4YMqxjt2p2iHomFA3+838EBt86/OebZTT+R0D6H+XraNyA4Oc23RyTSanFBKLmFMsc+QO8TtvewEIpPPEb0xSCXYG0M9OAvdB0XhwUyg4s0uIGv7Ps/BDNKGkEeMlJuuBPpvBA2i42RWpl//xqexeSI/xBepzdTC/AUDpo/cPcifypzYzOjOsoVRI3F3iqUgAvagRj8Z7ZY/UqukvRMxIzuZKwFN+LYtekspul4LM/9U2K5GjFQeruBOBGO74ipNVcTk4lKldTOn6b+0es/2h3fSl+4WFZNERD+COsjvQfGnC0GN8XT5gxt7CYnXzpGykhXivUABMfrlIMTmXm+63/lrDfioPtGC0yHUZa6Mp76/LKxG+nfuWo7mdl1xMSnQJBWlaM4WKUEkILfnXy/YVlz3qfYr2yICqbWopBbxzm4dHOM1A9csqAScfBcBQWBp4bSzSBBm/PkyfnX3lI5RqmpxPE8ZB7NzVW0FK0nMG1ctVdDEM4ZZIUHc7IquAGgn4Fg
X-OriginatorOrg: westermo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6b3fbf7-effc-4bf7-4636-08df3f1d9349
X-MS-Exchange-CrossTenant-AuthSource: DB9P192MB3090.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2026 11:27:16.8710
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4b2e9b91-de77-4ca7-8130-c80faee67059
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KRnyCEVt/I0lKxRGvH0rF6z2zcp+Cqc2TBk4u3bR5oBYdnXQf/IBjNi9At1q6zwXRWtNPhBIt8eGmwK/LGMd7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1P192MB2705
X-MS-Exchange-CrossPremises-AuthSource: DB9P192MB3090.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossPremises-AuthAs: Internal
X-MS-Exchange-CrossPremises-AuthMechanism: 14
X-MS-Exchange-CrossPremises-Mapi-Admin-Submission:
X-MS-Exchange-CrossPremises-MessageSource: StoreDriver
X-MS-Exchange-CrossPremises-BCC:
X-MS-Exchange-CrossPremises-OriginalClientIPAddress: 104.151.95.196
X-MS-Exchange-CrossPremises-TransportTrafficType: Email
X-MS-Exchange-CrossPremises-Antispam-ScanContext:
	DIR:Originating;SFV:NSPM;SKIP:0;
X-MS-Exchange-CrossPremises-SCL: 1
X-MS-Exchange-CrossPremises-Processed-By-Journaling: Journal Agent
X-OrganizationHeadersPreserved: GV1P192MB2705.EURP192.PROD.OUTLOOK.COM
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA0NSBTYWx0ZWRfX/5ZzpiM5Mhtk
 +pdffwLjV3baeGJm0uTigL79zZITXF2o1/opYvvW4Kvp2oqEzE4MXMTPWSKln71HeiZ5bb81E0x
 YIXkvU1L9HQ0KXm3jy668mXcdr0DuSo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA0NSBTYWx0ZWRfXxmBkfkoChB1y
 6lVt7zGUZ2VOwahLatTC8lO2DwxpHaDta3KyTd9SKPJOgPvY/DRzuYx+ZCmjlenE0x67lMkLSwl
 rp+iw3OUj9N02nEOPiVcDbxC0sltKWr3mviEnVcrVikeVN5UNcV2b5T+tEoRNXfSxjzDp4+WJqa
 fgJExmxN2w6kglsv9MUwlCT8xQPcDdPz8tFYAOoQ0V6pbr8EqkCz12L6QY7v9Iqn1itULV9VIe4
 cF5CEFOiOhOCxScZ5f4+FVLbFZjl4iiphSD3gGTwwC9KCBCen3Kk4n77om9bVN5sZOi7aFrBLVA
 iv0Wu/nt06AwmPw9g5N4yyVFwvGRPjew9oz7xTxWtbbHfYy7Qk6+JyggN/5qIEcE4toIJZe/BIz
 m8gCyU/5ja9DMZTGIgbrNX0cVhkEnvYpkXV8zu16lObcjpbtjKt9X7kj3YZhGYHLTWGLch9TDNk
 /urdt7+EQ7OYeIbT1ZA==
X-Proofpoint-GUID: XAKsiLi2PMYokHjMu88uSh_WyMzsxuEr
X-Proofpoint-ORIG-GUID: XAKsiLi2PMYokHjMu88uSh_WyMzsxuEr
X-Authority-Analysis: v=2.4 cv=KbhHIgYD c=1 sm=1 tr=0 ts=6af2ff97 cx=c_pps
 a=zl3lKHMaDmd0Td6fETa42g==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=8gLI3H-aZtYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tr3XZvuDWTETL0Uaxejn:22 a=8ys4xmT3Mru1TjC2zVq1:22
 a=N9GNhs4bAAAA:8 a=aqbuRCpPNhe5aDfEMDIA:9 a=QEXdDO2ut3YA:10
 a=PZhj9NlD-CKO8hVp7yCs:22

NL80211_ATTR_MLO_LINK_ID is a u8 attribute, but it is read with
nla_get_u32(). On big endian systems this prints link ID 1 as 16777216. Use
nla_get_u8() like the other places do.

Fixes: 7794573f9151 ("interface: print links")
Signed-off-by: Alexander Wilhelm <alexander.wilhelm@westermo.com>
---
 interface.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/interface.c b/interface.c
index a33d051..92d3020 100644
--- a/interface.c
+++ b/interface.c
@@ -482,7 +482,7 @@ static int print_iface_handler(struct nl_msg *msg, void *arg)
 			nla_parse_nested(tb, NL80211_ATTR_MAX, link, NULL);
 			printf("%s\t - link", indent);
 			if (tb[NL80211_ATTR_MLO_LINK_ID])
-				printf(" ID %2d", nla_get_u32(tb[NL80211_ATTR_MLO_LINK_ID]));
+				printf(" ID %2d", nla_get_u8(tb[NL80211_ATTR_MLO_LINK_ID]));
 			if (tb[NL80211_ATTR_MAC]) {
 				char buf[20];
 

---
base-commit: 121d91aaeca37f70977b9ae2b14846a01fd516da
change-id: 20261110-mlo-link-id-c02cafcb6c06

Best regards,
-- 
Alexander Wilhelm <alexander.wilhelm@westermo.com>

