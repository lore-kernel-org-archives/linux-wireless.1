Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.84.63
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795071060;
	b=hQbnI5qyM9P9+sl2RI6UN4XmPqNCeMkqtTkVVovtgvfJ3HKqPhhN4f39DZFL3ghmieGi
	 hrolVTlNijNMiqVq+bNI/nX15S74Hf1pta84VQU5yBTVeRnysAVow4FinAALABEdz4mgI
	 Atp6tobRvtmHlj8Sl5Hitgi4jQ2TSuxutEv0/XrH//i8haJ/NjnDUwlJpMg7pz9y1kWLB
	 lWE9ADB89V4fO6Tk+M1UM19G7okYjKq7mG5pk38LQ0V2HaAgPjdx1B4x9/HVNXYEMjtDV
	 HbocdiMSviSeAe1lAinzJp12AZR5o04T+1XdCRpRAhzucLJNXiTUTuprgxWHe/0uL1Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795071060;
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
	bh=QfDTC4wk4igwJ+/pO17cp6Cng/pAYGc4E3k2UcefNo4=;
	b=XwHMndaQ8bgHm8DmZ5r0x/UIZOC7lqg5PANo/cZA0P2ecmTQ4/veJMUF/KwrmvvoPv1y
	 +gL7N5o53tmZXgov7Up9s3TcxVv4vvUzswpzCCNS/2tZ+EDovPFpxCaC+GXd5VpgRWwXB
	 RUtZPRDnY+fzy8SyXvXB9td3ti1hHoAhJh4UA/CCqM1z5rJxwP76kMxEs6OHh1wphJ376
	 RI4w7U5gLwyFkwLM+3Qvr3od1QfCLPdQmtdyUpnXCI6P9IbYcjaeCt4MA1kaMjnJIgcUO
	 J0HmU4p5+nywZUyhYeJsLdjvV33DmIKmzhbayU96beo7oMIRzfUXslpw0i7irnILkIg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=UxxyAYqM;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.84.63
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010063.outbound.protection.outlook.com [52.101.84.63])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7605606A320
	for <linux-wireless@vger.kernel.org>; Thu, 19 Nov 2026 06:50:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A7605606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=UxxyAYqM
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qkF5urE1Q9LWfUh7BQZjyMt/B7IaqhyR3EpPmrTq6OynR++l03F/o9hp2cMgk0T/AlIj2e8KbqYZIpacI/aixtFXTYngi8q7qUsqi9IlvuQP7tIZzH+sEx43mEAC5LwncZ84fU43jyLsd3zsJV8CHoEj5ESB3IPfN3u2D2QzQmD2JFJ7T7aRW8KVMuBYDA69J/yUOcRJMFJKAsq6iUg5k4tLKxJisEY9v3+1CtcmvYaE/959nqWXlhcj8CJyDYVUIzUSu2b2QmO/pmBKJEbaM8fekBwTCvY+iyNmhwUPOOgZcUkIGONd1TCdPll2y4vF3Q9OnIWeMBbeItNmQGEQiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QfDTC4wk4igwJ+/pO17cp6Cng/pAYGc4E3k2UcefNo4=;
 b=bdkgfk3IZXxsC9jNO8jVWR86ZE81s52yMFBu9z5AWMZCamG7lmKht0NgcfnzPhP6PnBHrqx4BIa0MWPsGM6+YK4DTD9WTnrVSKCsIRKDouH/xzTpvKC04Z9ubAuWgzxwZXJGiZvfnnCnz2GYcf7LI+vFMdgL7Pd2+vFqFnhkBHWw5EGWphi/UPXYLKTCnz4zE4q++tqf+C95xpnkBVPx5WMxYudlh5XHyDmQjuPuCRmBE/kmFGZnlNNR3Py0NtKZIKrW3APTb9tL0jON+EbxNlx4A2RwwsZo9pu6jyXFkHUxfnt+3YiXJr0UazhVW3OPTuSGJPHL5zSC8k/NpI0EHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QfDTC4wk4igwJ+/pO17cp6Cng/pAYGc4E3k2UcefNo4=;
 b=UxxyAYqM+v0sETOwbeCwzzv4xupUTL/iccAQhV1tqFhxIZBfMQVr5pMaclcJZLtSJ909Miqo0gm/AANGzjVk8mlC0MsLlwQYnESkKeHvQX0ODSDCaN8bLXxlo1lpngsGHdW8qUvkOyWirdF7t5LiBTERIxUk8y/miydozmhJ20oGpXMAuTVA/6bXtRaB9+jO0XVa56ABudutK22x2CmRoWMKGva4pB3zTvI6b0uu0jpuWv+Xl583bAhR/U2Jp+PX2WBz+A0+Hltob7PXhOJ6B8wAeZDNBUIXA7zWzU2Bb7hzkQnmsqqfRWB/xZp+/MK/V/SsMKRMnYp3c51pjBPJZw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VE1PR04MB7280.eurprd04.prod.outlook.com (2603:10a6:800:1af::22)
 by AS8PR04MB8133.eurprd04.prod.outlook.com (2603:10a6:20b:3b1::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.10; Thu, 19 Nov
 2026 06:50:55 +0000
Received: from VE1PR04MB7280.eurprd04.prod.outlook.com
 ([fe80::92fd:f75a:a302:f859]) by VE1PR04MB7280.eurprd04.prod.outlook.com
 ([fe80::92fd:f75a:a302:f859%4]) with mapi id 15.21.0615.015; Thu, 19 Nov 2026
 06:50:55 +0000
From: jeff.chen_1@oss.nxp.com
To: guohongyu <guohongyu@cmss.chinamobile.com>
Cc: Jeff Chen <jeff.chen_1@oss.nxp.com>,
	jeff.chen_1@nxp.com,
	francesco@dolcini.it,
	johannes@sipsolutions.net,
	linux-wireless@vger.kernel.org,
	13057616121@163.com
Subject: Re: [PATCH] wifi: nxpwifi: fix tid and reorder-window bounds checks in RX reorder
Date: Thu, 19 Nov 2026 14:50:05 +0800
Message-Id: <20261119065005.556726-1-jeff.chen_1@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261111085700.109141-1-guohongyu@cmss.chinamobile.com>
References: <20261111085700.109141-1-guohongyu@cmss.chinamobile.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0015.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::18) To VE1PR04MB7280.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: VE1PR04MB7280:EE_|AS8PR04MB8133:EE_
X-MS-Office365-Filtering-Correlation-Id: ed3d19e5-8403-4ef4-427a-08df460975af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|23010399003|376014|1800799024|366016|18002099003|22082099003|11063799006|10067099003|261026140227099003|261026121527099003|261028144727099003|261022105027099003|261021123027099003|56012099006|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	5Uj7/GrQz3duwOGDPzC8HlPMBiedt98afg7vdW+Fzn33TtugdcCcrbuKu4koDM0rUVy20Jy0f+kJpjj3vB5qSYEyM6mNVBcFWrC3bsDLDVQyafCO/c1rcqMxzrEUuhzvvWwgimLby2m6PSsVj7gSHYOk1YDeLJVgRM3Qv8mR0Sz/cswU5jGUNZONf8nf1B9wbErW1G6E2BULh6elmpSgGKgWbQsoNygVc0hrvmSuzvi8KDqNMWwu0Vues7N2gYHaaaI6l1PCGDXpKjw8aqF+BAtq8U3TfI223W3KRqKHpcdtVhUhRt6Lm6/TCnjQ33OQ3PC7NvVl/Z15EV1Dz7xT8z9n22p/qzL1Sy/T5Airs6oSg3kbbozHGRlX3CpbcfBF9Lq9bORMyU2lfwD50/WXC6m9kDFkaMs6M7m3NtireCEnKuDIgcOJEe5n2auAiiKKwoQI/2igd7wqgfVkfLYC8YEy2z8idTiA/RYgU0bH7Dt8aqpMjW7ve6JOQoNu8zUG6BR6t2f3jbHN5OD8BqdU1pOReRXdmDi5Kfc3q/aXAScSoALwALeuz5wTEAczHirE7qSCnqNVAtxS9cto6IUQH9CeOceVRBj2nl6Pree2zghwmzNg+hIgOz/47wOp+Fv12N8O8NGZaN9GDo8jG/YfMskh43kePUPR9kNKyDNSiEM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB7280.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(23010399003)(376014)(1800799024)(366016)(18002099003)(22082099003)(11063799006)(10067099003)(261026140227099003)(261026121527099003)(261028144727099003)(261022105027099003)(261021123027099003)(56012099006)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?rB5sLFcii75lWgDCMAM7npfGfdUlV3o5wLEGsElxYSCVcgAzZDPbiNrtrEIM?=
 =?us-ascii?Q?Rd75b8q0B+SDY+ZWZAV4PdNcVnVZ8tTBJDTxNel5+6ZxoiwTefDUcNPlkt8z?=
 =?us-ascii?Q?YoqI/e85aLYq9P8vn/g07R4w7frLiLjm6xv5fV7HUV5zdGrel+QqCnlY5VMc?=
 =?us-ascii?Q?XY9Qkx0QMQcSpdWGQbi1Rvv5LRc7IGEBqp3Rca/a1hXg0ROkeWZYePRWfwjP?=
 =?us-ascii?Q?HQ0Xkidpafge4KQEcBJoyh1mK883TzgRfGtDMKp5moekgrmPY5n8R3uR7c5h?=
 =?us-ascii?Q?Iq4s3w5shYXYwLcrVRAKQsaMj65O5bD76rKbDNKLQa5L51etO3DwxVpl88Gk?=
 =?us-ascii?Q?hQX7Atvk2CPQuU4imTb2p/+QghEHzvDIm9vjkvaPROrDRXVp14DIGTWStQFk?=
 =?us-ascii?Q?FXrkbw7z1QPiIw5MMem4PZPafxl9prteBS2SDJUv8Hgu3toovkGWuyzYtz4t?=
 =?us-ascii?Q?iUKI1qFrCmDqEPC5paMbCebrZSF+VwZr0vbXvU7hZS8fMoG/Xx7qyz702ZhC?=
 =?us-ascii?Q?VHoKIcIQr2QVNyO/E9Zf7+9cg9/6g1mF0QfMrCNIs3xWzU3P9YJ74g0db5Tr?=
 =?us-ascii?Q?97YinYh/JQjRkfK/LarE1xPjVmobipkJSazuwE0ykJg3utjb1Vn/SH2/9Lma?=
 =?us-ascii?Q?8BNuvnhevOJSx5LdKN0tszGxeBipVkNjnX2lrFI9XAg8io1q5B76WBev3QLA?=
 =?us-ascii?Q?rhCKFzMk7YKM6Gj1dN0uOLQyhahX5Euim3p6KQ1Xe3xe/Ori3p/fVKNm5QqN?=
 =?us-ascii?Q?MTkRg560A/mG5/OjYpPMOou3iQAX945m/AWXljj7icB/xjpW/xdnmK0MUugy?=
 =?us-ascii?Q?YgBl5lGHGBRfiwDSKhwVtAcMNUDBqCRccmU65bnM4A9RDTkLiPL7Fq06QZWa?=
 =?us-ascii?Q?lMLrxk2UeaUvr3rL/HnSxOMgLFBu/vzMsPBjP5SvjRLp4pUsxMlmVcg7cD8w?=
 =?us-ascii?Q?W0ZJPbZYTt/2vrsR48+GUpkaCJs0AujrTT1wQd/OIgxXuW/llKKdFGcY71Wr?=
 =?us-ascii?Q?X1ZsfykEDZMQkabeAF5bYYe1z710FdByfy1FVXg+B/JIB6LQZC86jVMsGJEO?=
 =?us-ascii?Q?j0M6yBPsDjZ7d62c6gdn0aRb9SAZQVkfla0oSgBmdGS9XI95jSNoufAGyA5Y?=
 =?us-ascii?Q?Zn3huvJ6ANMmS5pE/0wbs+CLpsh5ETHrOzqsrHpsD0tPikWw90pwlxOGp3/9?=
 =?us-ascii?Q?Uzxy12Lu8EuxJCuguoHS6vnDe94Grgr5C/gUgLlgasT208v1xc3G4p/Pz9lS?=
 =?us-ascii?Q?G096JeI/I4ULPsKB3WZIsF/I2PnMQJ7oR3+HvTfMiVn83uocy/UVKmSRm9nY?=
 =?us-ascii?Q?xhgXI2ZJQ8pvLDIYxwcfcLoPiEwfy2U+dnUkhVsO5MxRzqzS7XBz6/Et1jv8?=
 =?us-ascii?Q?S5DyIbygEKdOWWzMA6A1rGAfo7Yelg3hUda5pJZfFtE+gE8EpHwf6Rw9uC0E?=
 =?us-ascii?Q?tdxUwejTWu3KZN7flFtKEUwBBLChYLEmcq02fPYnx/4xFcE7gvKh+7tXLOGc?=
 =?us-ascii?Q?naJlIDdRG0ZKHsD+4a+EY0kskRPB6fPMuLq/6Ze8i93tHQq4tcv6qe2V+AWo?=
 =?us-ascii?Q?R9LFF9NwTRdoYSFyKF6zGgQUFh1h7QY4CLN8odBRMJiyrsqreb4SBDW+bARy?=
 =?us-ascii?Q?+ZpZxqw8dp7HW2Y3mrrUkpF6e5F4NwmXIMXAJWJv7SEm8vPjlYpwgwe5C3aQ?=
 =?us-ascii?Q?fqHNktt5cM07UayKeNmpapIhX9hity+THcyUUlD1qHV+U0XzOTm+LLnmRTZx?=
 =?us-ascii?Q?f+idWaFeI93myf4h/hptmVp+3UrxRVOpXjXDf7K1B+4a9Ch6r7/y?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed3d19e5-8403-4ef4-427a-08df460975af
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB7280.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 06:50:55.7987
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kqxy2gO4wloPPIOYocnV3CeP+3x9UJ4G1v2iO6EyHdRo3zQRGjqvpNDio2Q5ZZS+kdVOwsIb4Qf6g6HPsT4JFlGlDE60PHpLvQSbdc3ZpBNMTw008lp2SJekMthY+fbG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8133

From: Jeff Chen <jeff.chen_1@oss.nxp.com>

On Wed, Nov 11, 2026 at 04:57:00 PM +0800, guohongyu wrote:
>   the out-of-window drop check (11n_rxreorder.c:459-470) uses TWOPOW11
>   (2048) rather than win_size, so a seq_num within [start_win,
>   start_win + 2048) passes the drop check regardless of win_size.

Hi Hongyu,

Thanks for the patch.

I don't think this is accurate. When seq_num is beyond end_win, the reorder
window is advanced first, so pkt_index remains within the current window. As
far as I can tell, an overflow is only possible when win_size == 1.
Also, win_size comes from firmware rather than directly from a received frame.
The added check is a reasonable hardening improvement, but I don't think the
commit message demonstrates that this is reachable from peer-supplied 802.11
frames.

> +++ b/drivers/net/wireless/nxp/nxpwifi/11n_rxreorder.c
> @@ -266,6 +266,9 @@ nxpwifi_11n_create_rx_reorder_tbl(struct nxpwifi_private *priv, u8 *ta,
>  	u16 last_seq = 0;
>  	struct nxpwifi_sta_node *node;
>  
> +	if (tid >= MAX_NUM_TID)
> +		return;
> +
>  	/* Existing TID/TA: flush and move window to SSN. */
>  	tbl = nxpwifi_11n_get_rx_reorder_tbl(priv, tid, ta);
>  	if (tbl) {
> @@ -421,6 +424,9 @@ int nxpwifi_11n_rx_reorder_pkt(struct nxpwifi_private *priv,
>  	bool init_window_shift = false;
>  	int ret = 0;
>  
> +	if (tid >= MAX_NUM_TID)
> +		return -EINVAL;
> +

This does not cover all callers. uap_txrx.c, the RXBA sync event path, and the
DELBA path call nxpwifi_11n_get_rx_reorder_tbl() directly. Please move the TID
validation into nxpwifi_11n_get_rx_reorder_tbl() and return NULL for invalid TIDs.

Please keep the commit message focused on what is wrong and what the patch does.
The detailed call-path analysis and reachability discussion seem unnecessary.

Thanks,
Jeff

