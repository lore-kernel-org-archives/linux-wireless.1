Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.72.40
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795491274;
	b=i2qyKlmz42+OEYnvyhqLEkCvjv132jcOfzNBDNsIrfFLJYTHlTHKoDdBWaLG5TPDq5wx
	 iQ3Npz/zwJ7gqnvxj2M3bRy0yvAIytQGK/WHHc9zXuhHjIH4gbdIIpN+6JAD1Tn2TxwLN
	 jRrHZEhPzLGtKLCAlkx5hNf+hAGOSq46QAmRbQbzMvJlWa0YAHKy4PK6d9rC4xqqmolQM
	 CbgMPp2SSjr9eIRWbUtJSToqb7ejMXAtbk2hKTLSWnO9EjxAM85co3whdwtCpWgLKU99R
	 xRcYcbNyEXlq99S9Soi/QhlGEI8J2iE3vAn0ScnY14o5hemTSf6uhD7z7VXUdDvTKzw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795491274;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:
	 Content-Transfer-Encoding:Content-Type:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=C25zNMeT23kzndjijolQBbhSIXpQ9fpCOvZVYwNa6So=;
	b=wVwaXiFZUUZop6rbbMPbQt1PiBh0YyJPO92qwRQoXLWBlCVVCGnk/8fH8tDnxTjekIKH
	 lWVOt841yjCQp7wwDKAMKRWdoYU2FO81QuhtVYgk41z5K8fF/Z4aeX9W+JX+FO7F9+QwT
	 a894PRBSrvMnlGL4Dn4zfg8i7oJprCZubIFiWlnlfPhXzY75DKT+RiNy7FNMotYgzod1p
	 VGwNqOuYX8S8/4EKugVggFNHih5zLo66ebRA+pn6Kjt/au2hjEHqaUzAqp5l9OK6avFlO
	 +jPJBRLXWkVd4T8FS1pjyRrmIPKH7k4W8LcqnQFM/cYVual8XvBfMZaQjpXA+OeYUNg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=Z2CwB9Md;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.72.40
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013040.outbound.protection.outlook.com [52.101.72.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89EF0606A31E
	for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 03:34:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 89EF0606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=Z2CwB9Md
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IxHG0H+dKnwPYynGM9eZ4n28FjpD9lUPyX0hRpzWYCSjjazeei4ffsAvXGkgkJHgoTsTbtsMPjlKEevpObXyWdP1J54s/9d/0OpG/lb8JAsHtMlvaXO4fMC2ki+aliKs4vVctWgx9rKVaexUrgNvV0O6KOVVLNaVGTbYCJ/56qdrFkl6DOSznwutBH6DyobkgD7K1zzO0Jy8zNiHsG1NTL3iiYbCCZD90gwvkMzQIHqzKku1LgElrb96//aCoO0fG9cSrfB4rfql6DfL1bLx+STfT6e1iyzHLZtwNd18WaUfpcPjehMedEB7WXqyD6Fbjs+HtslDCdQNDSkSojRebw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C25zNMeT23kzndjijolQBbhSIXpQ9fpCOvZVYwNa6So=;
 b=BJ1S5PE9Kkhd0ztS3du2xykOsy2mLNhsnZJjmtEYZ+uvhRSfNoNM0a5ZBQM3Tfh2l+q0ErYXdHbPVae6PKkDjn0FzMWIZpwe1qeo8FPXm2fDUUB1z787PBCkSppKalRLyeyRR/rhRaz2aecEtE+MtCDBcMnNl56Db4cx8wu0D6Yz9+C5Qg896WENNBSR0RSedo+YbzkuYA97jMEK1quacTHQEKpK/M0kdkHzicmnmDbZ4KfEwiKwoyuDPmMR3nrY3c7nzF06o8pv21GPkq04tX1AWfDI4UUXpwx08kgLAyQ9jRydPh+d9QV4LMlyATAYcRRlGd30kuDlJy3dL9W2Yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C25zNMeT23kzndjijolQBbhSIXpQ9fpCOvZVYwNa6So=;
 b=Z2CwB9MdruIVL/fYBpx0VMIVfgoC8/HrvGBuqMbVAeHQRdFa5ofs34B3MDSTDxXA6cmUlFnzMdk2UA0LHMKvza0r4zvUsaCOJYHGroSqfJJ1pD3y0NRtA/+dfNl7RdIPM0E8ZIqAoC5OBwRvXtNmfOvdlPMC6ETZgVaIomhngljiVNSp3ptiQaLoumUabo7GZj9Yr4ndKapOqRjG5XsdDiBxpR8/gUgW4tYSmf2jkbReV8P0Ovs1wHPpjYQcKfV3Rks0iZt7DhuCmvrAHIYYb7tfuJDH0l/bGcfNrjO8WnmMSMgPfkpuCNmqRqKAOXQOp2+u6qk7k8d2/lHIYnqSww==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VE1PR04MB7280.eurprd04.prod.outlook.com (2603:10a6:800:1af::22)
 by PA3PPFBB9BDA27D.eurprd04.prod.outlook.com (2603:10a6:108:1::b0) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Tue, 24 Nov
 2026 03:34:30 +0000
Received: from VE1PR04MB7280.eurprd04.prod.outlook.com
 ([fe80::92fd:f75a:a302:f859]) by VE1PR04MB7280.eurprd04.prod.outlook.com
 ([fe80::92fd:f75a:a302:f859%4]) with mapi id 15.21.0639.012; Tue, 24 Nov 2026
 03:34:29 +0000
From: jeff.chen_1@oss.nxp.com
To: Tristan Madani <tristmd@gmail.com>
Cc: Jeff Chen <jeff.chen_1@oss.nxp.com>,
	Brian Norris <briannorris@chromium.org>,
	Francesco Dolcini <francesco@dolcini.it>,
	linux-wireless@vger.kernel.org,
	Tristan Madani <tristan@talencesecurity.com>
Subject: Re: [PATCH wireless 3/3] wifi: mwifiex: cap TLV length in IBSS connected event handler
Date: Tue, 24 Nov 2026 11:33:21 +0800
Message-Id: <20261124033321.796494-1-jeff.chen_1@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261101205802.2909524-4-tristmd@gmail.com>
References: <20261101205802.2909524-1-tristmd@gmail.com> <20261101205802.2909524-4-tristmd@gmail.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0332.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ea::18) To VE1PR04MB7280.eurprd04.prod.outlook.com
 (2603:10a6:800:1af::22)
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
X-MS-TrafficTypeDiagnostic: VE1PR04MB7280:EE_|PA3PPFBB9BDA27D:EE_
X-MS-Office365-Filtering-Correlation-Id: b769a4cf-6325-486b-4f00-08df49dbd8ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|19092799006|366016|1800799024|22082099003|18002099003|6133799003|4143699003|261009223027099003|261021121427099003|56012099006|11063799006|261022105027099003|261102123227099003|261028144727099003|261026140227099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	vdhxkXRoFv3C7zRC1jZBL9ifaK7L8yozVtyCv7z+WMtwhXFOzvf27yq4unv2OcoDljc9Wz791xeig1UwxfTt/TL5ji1XHJ8r6NQC8+yzqD6gG92IRR/ealx3IaFYdnJ6EARixYPCFnlrSt63PRCYhkzucoeh6ACcjazKLvt/VS0H4Z17NfHfWBxhWaZFWmBgirvTN2hn1Ng+ECtFKB/NgudHkpGxW+8Y6lZ0PJhCmMaNaU4YW5mh6lafufK8FB9HMgdIs0vF3y1LSlNRYMoYoKf/pef3MlxQXor+5Ri359E/9P/nYEPyeOrKuSmCdTyO5urIwxw/i0yuqyjtciPFZtwdsyAVTCG4cBui+An/h+vLLUBqyyxY3Q7CFLEaikBqvIqub7CIbLSVFPQ8LBuAeWJpOOKdhRIBOctnQvpPZXmjTlOZtwNMq3ZnMAnUlALE9uYrshoNBMlFXVVBPoJeOzVk17FjnRd5M7mhUzkUqJVIeDFldsPFeFGsVPuej/PaaOZJEug7uevGcpGIj04MudpNN6T9gCEDwK5o15mwyN0hqsLe7JpfWeef8aPIf4Z+kOWfDKagGjeo01QSSI+8I8U1gbvr/Sq7ugVJc5j5blg8+Va7aYLCBZCLw2CoLyvA28SXs0s+yAc8JmtS4916GE7MCsePmO9fyMgQGUkQKR0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB7280.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(19092799006)(366016)(1800799024)(22082099003)(18002099003)(6133799003)(4143699003)(261009223027099003)(261021121427099003)(56012099006)(11063799006)(261022105027099003)(261102123227099003)(261028144727099003)(261026140227099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?iClhBtMKU9BA6Z1UPjq2ESpKi+z3rCQnweWHfJ1wo2vtgiAcc007olyAVeTQ?=
 =?us-ascii?Q?6bLnOtmxvrpzTk7wb/SJ3kJ0gcUaKQlOo2DVthYZJy4NygnllL0ZC7ZCiIMs?=
 =?us-ascii?Q?NwNRWwWz7dcr4tw5E15fIZ89AR8OuiOs+VzSRgEd2BLSAo9CQfBeFhTqo4VW?=
 =?us-ascii?Q?+NLBwToMEfqvcaM3S5JtkhXkt72QYkx3PWnFqGzMxwam3T3z7fHKlYtmstxY?=
 =?us-ascii?Q?VoPYEFszOxBKlz0Njfr7rQ7vEH4e5bNRd0iaFJJuEF+L1PdK059u027o9cR+?=
 =?us-ascii?Q?XOOwhFFyvn9jbtNlI55/FrP9CdtsN8H3fBeoUTvSb8Vf47GhzMmLldb4L/Jg?=
 =?us-ascii?Q?KPSf4vbPT1F2RfnBEY89Iy2tEZcYixYsh6HwoSbNXEo8ALMlLyez4iFRfwmg?=
 =?us-ascii?Q?yf99BZSInZ6ZwmZFQaTbXNFVFZjrrAqXFJTqnKx3nHF9lW3+ijj4RmWAD0fQ?=
 =?us-ascii?Q?v0PFpdWkbv1pxAPF3/1fDRA4hFVQxJ9KygdaEvE7DT70wTVdF4TLiJ7oxPaj?=
 =?us-ascii?Q?fFAQq4ocw3kqFqgd53b/AAKlnhHFZH+1d4Cl3W+ikbYFOLMwWrnMXOXgzG6f?=
 =?us-ascii?Q?aJoy1OJgyh4LSVdSHcwzWt5rk9fpVi2Jc1x2Ea1/Ow4/9Zziw+K5aoD7EYFz?=
 =?us-ascii?Q?+2GVlpvSK4LGjqSHI4wR3Aq0quLnZOiEGYRSagPcsACx68Qh5PvP9UNcrdwZ?=
 =?us-ascii?Q?Ykt7JAsCLMsFRKvKfIbBaQ5r4n034BJ6J+HEnsVSNM/DrM+pvjwnARsjp6W0?=
 =?us-ascii?Q?BSg6MSy2i8xXXK3LlYZ2DWwufk4nOFGoUidh7xcfR0ihn9pxCORKDB67xb3I?=
 =?us-ascii?Q?WS4uWoJUIIqUv5SDge9BVXVg7pw0AvKJGamRoxcUaUXsV4BNsoQ5jZVvbIvm?=
 =?us-ascii?Q?QHOcT4NPopyn+MEbCrzuMC0XfXfwod67gVs9XEZZIks2YMO7pLjl4iuI3dHV?=
 =?us-ascii?Q?PCU8EY3SexHKmtYBVo6o6BS2AJ4Ac+WNJK3si8AtqIcEgy6MDBNcJCwDiN/j?=
 =?us-ascii?Q?HoG33XkPA8/W3KGfxwMeo1o5/rnFgtR1tgqcXf9Lohf6Du3jrV770i/NsB3f?=
 =?us-ascii?Q?JkYGaRiHvObZ5aBp0gZ94/eJokDpn4S4QM3O0Gi5JZ675bqaGZ52xZjS17cd?=
 =?us-ascii?Q?5OAMf/0qf5SrEXAuDkiSvthjE0cDcsv502y9SI3ed5iew3YPk1qAQeRsNAaN?=
 =?us-ascii?Q?CX0KQYvJUML+zayujqHJjgnyIZ2TipJY8igN72RPEBAL5FTSZyKFcFqVJ97b?=
 =?us-ascii?Q?2SeCcBBFZwnB3OYKPT2SGYFbTagruuB4R/YMACNEh4TvUoFYrSw3Q74JdJtY?=
 =?us-ascii?Q?mO1w79fH2fsyCmSDeJy3PlqhQ38fH8pxyvn1Rl+k5FrzdnFPfyLAYkAyYQrq?=
 =?us-ascii?Q?NyZ7qguT3oy0hoGabVkbE2dEW7uxGUybQzpEz/E/OKkiuk10/gbFBtrvymXn?=
 =?us-ascii?Q?Nc4M4ZJBhl4igg6p4I0+yee1bF/C5sCXbo5yEyJ7QpqGTLGyEQA93NWumDVy?=
 =?us-ascii?Q?Rh/Qd7n/0ri+T7lmXEHAXfgItR6UKBa59JB4aO4egDHItrIcuKzjoeVNzvZl?=
 =?us-ascii?Q?JrWdqXgl977SKCsqjFFDmggzyEQztswOkVM7DyJu8Ijtja+/6wfsy0Xr2k7C?=
 =?us-ascii?Q?NeIuNz+d68IPqdIWG6RZgaqJfYJ0prPPMJ02d/w3y6t4oHBOo5X+QZViyYPi?=
 =?us-ascii?Q?85HGlsZfob/Ax6B2+R3QwDiYGi/9I4R7hv8HnoGJH7ejUiuJs+r8byAEXizt?=
 =?us-ascii?Q?5f/fXUPOPM5mIwjZ133YeQ7xpmurZABkq4dFfjRy32TXzLK/o/3p?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b769a4cf-6325-486b-4f00-08df49dbd8ce
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB7280.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 03:34:29.9042
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BByJdAXiip6t1HizeI80i4RRdmIKwZErpLYWlVko5tZ3Jqzv1xvb+R7PRrlOEqlMjBk1FBM6RTZCNVPtJ8sYgS4vW6NQCyKPGCOeSrdbPyRWAprNfgX4C1DmuPaC8noV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA3PPFBB9BDA27D

From: Jeff Chen <jeff.chen_1@oss.nxp.com>

On Sun, Nov 01, 2026 at 08:58:02 PM +0000, Tristan Madani wrote:
> From: Tristan Madani <tristan@talencesecurity.com>
> 
> In the IBSS connected event handler, the buffer-bounded evt_len is
> replaced with the TLV header length from the firmware. An inflated
> value drives the IE parsing loop past the event buffer.
> 
> Cap the TLV-derived length at the remaining event data size.
> 
> Fixes: 432da7d243da ("mwifiex: add HT aggregation support for adhoc mode")
> Cc: stable@vger.kernel.org
> Signed-off-by: Tristan Madani <tristan@talencesecurity.com>
> ---
>  drivers/net/wireless/marvell/mwifiex/sta_event.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/net/wireless/marvell/mwifiex/sta_event.c b/drivers/net/wireless/marvell/mwifiex/sta_event.c
> index 1f746e8f6b3e18..3f683698e4a60d 100644
> --- a/drivers/net/wireless/marvell/mwifiex/sta_event.c
> +++ b/drivers/net/wireless/marvell/mwifiex/sta_event.c
> @@ -45,6 +45,8 @@ static int mwifiex_check_ibss_peer_capabilities(struct mwifiex_private *priv,
>  		 */
>  		evt_len = le16_to_cpu(tlv_mgmt_frame->header.len);
>  		curr += (sizeof(*tlv_mgmt_frame) + 12);
> +		if (evt_len > event->len - (curr - event->data))
> +			evt_len = event->len - (curr - event->data);
>  	} else {
>  		mwifiex_dbg(priv->adapter, MSG,
>  			    "management frame tlv not found!\n");
> -- 
> 2.47.3

If event->len < 30, curr is already past the end of the event data,
and evt_len can become negative.

