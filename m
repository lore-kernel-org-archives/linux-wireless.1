Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.69.64
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794503008;
	b=oADcfZnIIlLXwUTX5uIQuSpRvnYOGCnvaSH79d86gBXmJ/DMciUiM7144vITWyjKGyVG
	 cXFmpGrVA4VzrK8TewjXTDrmxi4lFjUHtl7FWEwteaGsLvgMW3DGXL0DU5ateahVCvnXm
	 yeeLakLLZuYlSo0a4w1XkojgLDa/pRCuj5ZpXJN8PdK0cEkziYhj0eyf1QDSFiwxpiV8Y
	 FUQBJ9jdhpmUwZj6nnsfplclm0Iaz5rLHqsKQ+ck8vKb45AvcmDBfu1Z22db18zHg19sL
	 kQoc+g6OlICwEH6FaIIbtW7/+TH3Hx0/u37h/KwP22nIZpBT+pibSN4i5R0Vwm7gaUw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794503008;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:X-ClientProxiedBy:
	 MIME-Version:X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
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
	bh=URVU7Jsent/YW7fpA2yzvEW3DbqGfLOBDR3JHF2pibk=;
	b=ObRte0yNyE957Qa93FY/+IJP321ynbUue47V3MgzAzw8f38t2yp7c2pXVUP5KEXJpaxj
	 AbIlurikBY3jQ+OfOr4me2O4GDWrp69b1SO+JjHkm11lnsg+0gblF8mr8iqvicK2AqCgQ
	 XZvjqtZCbiwGB3IYqZ3Z00Chjlu1ubUEyRX+y28CQOufcplt8OjYhfFUdbmMTXnGOq2y2
	 38MilzU+0ZSkezL4j638dfN96zTPqDXUhKguqi7Nps4YUwcptidYLFlQYISBFo3H/HLOO
	 r3PVjUaXlmFnUwo+C/yMPoNrXn4Ep9LiQTXnpIyImQOZX37ZElYE0xi8vCpwh3+cVIA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=L12H0xS4;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.69.64
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010064.outbound.protection.outlook.com [52.101.69.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B81A2606A32D
	for <linux-wireless@vger.kernel.org>; Thu, 12 Nov 2026 17:03:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B81A2606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=L12H0xS4
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rdtcmzp+H+MNvEaYHcRUEFZ1Mmeu+LJmzEq1J8hzkXyKDg91hzAFPmtiLd83S87kWSAMY1+tEJ7VP0f1Y8pxhRXAKS8huNpIpaNl3jMIKihEbxbWhdUlWOL4pHpYGcZliO8FfFQ746iGkxadCEJJJlMkDtSQlPQXaUwDlIc46YpM1xe6df4pbTalJYv815j4En9Evdgvdn3AqG7SPs0dSQsslcXUiFYru/hFbLA4JQNBNsFc1TCfcJUhlKpkF/M54E+K2T0GJeigOEM+g9VaT4ZvANrZ/rNQ/GG4phZZT98ydMz8AeNovW26Tl8t+7+znwIhwaMsOeI+WUzmcPfKxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=URVU7Jsent/YW7fpA2yzvEW3DbqGfLOBDR3JHF2pibk=;
 b=Ryx+3ZhGpRjn/1YNrrUvgP32XkGVYMgcm9UjDFNImo0FYt2sfQWzL3VlBoj7di1SQDj6+JiWO0Ym47F1A/Nvib2fl0ZW974c9cK1TCUZkKMHt9Uxc1aZjjjd0qiRcvhZT+ywAN9e/ctDARQdTpzdDADaeSTr1mQCvdjh07kL0JWhy/sQ0VIi9WVTEUNVJR/3/vlEiabBa8+4dRTaDycW2fz68vwUZrqVH/cGvJ5Z2IJd2euA2s4fYmfP+hbldPnifO825a2RPcSdodqkRIi+9MBUkrN9zcdPk0Nvk89WYsbpRwtF1ot/ZcmajjHHpwRx/a1ww2e2MPO199cSSvp9tQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=URVU7Jsent/YW7fpA2yzvEW3DbqGfLOBDR3JHF2pibk=;
 b=L12H0xS4mOMhvEtqxVFqusrVL6lF/nR8fY/bHwZKGEtLPJvs0HoQGy/7EQUcR8XkGG29wrvdUBylKwBf93Spuct+73HXfxgIalRbWwaKYAPM73PMELmBtNmqsWSFpGSs+huyRfEQ1YAWHgo7BPekEmwNcIC1fOngayav+oUxfoR3wyUU59jAB9wbb+hO8FGX2nYnUxuYEmg+pfe1ZYc2DCgAi6cE1XtySZhf08AEWOYiX0mLJSvjt/f3nLrGQ+oTZz8j00a7GP+uA0qztaC7gDd/+Rnno1FAjZpdflFbIYWNlsxmFEYdHnM7nV5y4as3GS8fVWPDW3XXAeY8tvI1Fg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VE1PR04MB7280.eurprd04.prod.outlook.com (2603:10a6:800:1af::22)
 by VI1PR04MB6783.eurprd04.prod.outlook.com (2603:10a6:803:130::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Thu, 12 Nov
 2026 17:03:24 +0000
Received: from VE1PR04MB7280.eurprd04.prod.outlook.com
 ([fe80::92fd:f75a:a302:f859]) by VE1PR04MB7280.eurprd04.prod.outlook.com
 ([fe80::92fd:f75a:a302:f859%4]) with mapi id 15.21.0615.009; Thu, 12 Nov 2026
 17:03:24 +0000
From: jeff.chen_1@oss.nxp.com
To: Zhao Li <enderaoelyther@gmail.com>
Cc: Jeff Chen <jeff.chen_1@oss.nxp.com>,
	Jeff Chen <jeff.chen_1@nxp.com>,
	Francesco Dolcini <francesco@dolcini.it>,
	Johannes Berg <johannes@sipsolutions.net>,
	Arend van Spriel <arend.vanspriel@broadcom.com>,
	Jiangshan Yi <yijiangshan@kylinos.cn>,
	Linmao Li <lilinmao@kylinos.cn>,
	Kees Cook <kees+treewide@kernel.org>,
	Rosen Penev <rosenp@gmail.com>,
	linux-wireless@vger.kernel.org
Subject: Re: [PATCH 1/4] wifi: nxpwifi: cancel channel switch work on teardown
Date: Fri, 13 Nov 2026 01:02:37 +0800
Message-Id: <20261112170237.343497-1-jeff.chen_1@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261028141819.7556-2-enderaoelyther@gmail.com>
References: <20261028141819.7556-1-enderaoelyther@gmail.com> <20261028141819.7556-2-enderaoelyther@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS4P250CA0025.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:20b:5e3::15) To VE1PR04MB7280.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: VE1PR04MB7280:EE_|VI1PR04MB6783:EE_
X-MS-Office365-Filtering-Correlation-Id: 2499889e-84de-45bd-20d3-08df40dedc6e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|19092799006|10067099003|11063799006|4143699003|56012099006|261021123027099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	OLlO9sE2NGqbxyVgUI+9M5KvPPktO3JQcz6/LwbGd2pE9S9wJTu8NPbWbrIMMeYVQw9z0h73Do9N/gBvp3iq9qZT1mBuEADVVI5yc29wxHanBp4TroF5qreJ0ZZLBIIDuunu8b7R8XtuRgN0iryVC4IzplSRJ/cgoBTslU536Ks+3AIg07JQfbraR5qcgFhy0ApGerA87+QuGeEycDxcnF/hJKuYqphZHZVU6n/rARNrhE+5n/xeYyAUG1j2SpFN2R120Ts4b4uwbgpVjQMTy/t0S6IfxKIYKcfL1JXD/MfY9zkp9sOkyWIMJUNmy2Mnb6L08PYExK0pZkiMM1Y7bgkEHbm1SO6jvv+0oqB4CV/7tFZUcTua1xqcyALRxkvFXuerIaukUT9/M8Cw+zeao3dvIV7186X3/U5TtiMuqxsbQ2kDURQuJKHPOz03PpNhLICaxUzZ12e2GLyJmnMn1l8umXbKaCi+gzOMTv6lUiUVroXDSGi6lsjfIMyEWbw1e1vVPYx4ZEhNZXMyDuBwMrF86oCIuCpYk24yq+8MdNHkRq5CzmJ1Ir20crGwlzICMW7vDPRedq7OqoAjmF+laoXJfIYtS6WVG/N4MS+XRN6LB1Zn+BDcJ12s4WeTW8bFFxQeYq0KFQpozAQTYavGiLM3cZ49K4FISGE4vhfzg7Q=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB7280.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(19092799006)(10067099003)(11063799006)(4143699003)(56012099006)(261021123027099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?uRGQFjCCEeiQ6PTMEeqGV8mpmTY3FbnoyNE6odOfNX8iqbux95NPsDuE9E0t?=
 =?us-ascii?Q?hlYSC/NFp80CNP/mHVdNlvF+eoYPXQvG5m7sHfFn0WMO1sbc5jXpsRy5mwoP?=
 =?us-ascii?Q?F2bvQwRRp0tgIIlpCdL6JwD7Qwf60lyw6l4FRqOgK++NpEKAgzblmDPxrv9s?=
 =?us-ascii?Q?bKRIQ4bEonUPx0nO6dfa5SBxNQHGeFh1XeS2o861nIDGSg/JOcvfYJi1Icjy?=
 =?us-ascii?Q?23l7FSTf2LOm/vtNIMgO5UfCf+E7AVkTpWX2BfUxpuy4g6adJFhfSLrcrT76?=
 =?us-ascii?Q?Cv+pxQjfmZsAEki60Zv1q9YTBPr/A5GWDSMNZiQFt8eyIvvZieR893k/knuB?=
 =?us-ascii?Q?vrhZxjZ7Ox6gfgBkajaBFmuR16LVbh6O5nfgYL2ea2/M9xp5DGmVojq20222?=
 =?us-ascii?Q?moML9djB9a+2Whd3cjGzc0E/rQyLcKGRtyF3mFQjYNGTbb5WmvUvHse6rU1H?=
 =?us-ascii?Q?uaNP6tioBzsf6AQZDZ91MR4dfwAPyNc3jqg9u7y3l9wBjErcrCF0RMa+HCZf?=
 =?us-ascii?Q?q4TnyNWqeUksSD/BOSpEHO8kRUd0Mt+pfuvAXSxHkij2y/f1srzQenyzpB+l?=
 =?us-ascii?Q?dt1TLdrWNOl7CMc5y3sLHW9mEHiLEooYJG29jtJvprluiyOZJtxhqmSGOB+N?=
 =?us-ascii?Q?vO2P5Hb9ZNN2e07+z8NUZAHj3m06rUcN9SK2haE4j6faLUmcNW8059JYak3o?=
 =?us-ascii?Q?KRsn9uGRdsyla9rQWRXoTNvYZVJBiPWwz5M6FlAzGNkNCIceBlmzTCmKfGOP?=
 =?us-ascii?Q?15f1Wc9OVoVp1ANPNSK9N1xUSWunYrYZbcE6CLtpPFEM7Iil0pK5mOFjYk31?=
 =?us-ascii?Q?e2xID9j0gZHZVs8vzumE31cr+uUTg7QsyS/GPlDlnVLoHHKP4St2cmOIegXj?=
 =?us-ascii?Q?8/gecgH7s/tfz9oCXj/ty7Ciemwbt9YKifrEi2MBIcpB+VgXtesivQW8ELGI?=
 =?us-ascii?Q?SCVlHDoTM8wudB+G91rG+jcyf2qtTmXkEffUwajedYHMTQZ7FZ1w7hK0Ft76?=
 =?us-ascii?Q?UzksK2LBtlFqgqd93fmdBpzVML8JGLo6aTrXKUD0B7lAZ858NDFDOlLwx6TF?=
 =?us-ascii?Q?ipS31PIF/xBGDiggYlxBonhJMsuzNNtlUOOGjdfWkS8YN2Cqh6XVYza+TjSo?=
 =?us-ascii?Q?iBe+dcGaAwAiAB+XCJmYx1vdz1F5OtnlJg9w1qmyycykP8K4EQi1zoREq2JM?=
 =?us-ascii?Q?JhPp+IxuFBxS7+n/LLsX/Y9hTsWV1/kmsXvhENpSvb5rZghR5NKAEfDXPlYG?=
 =?us-ascii?Q?Okd6AJJ39SWHuk0bRCW38q47X++pp7Qn52DHYRfWPelrKnBggR5rbKB5rDBJ?=
 =?us-ascii?Q?y6XeKDXl0BcheNtyoZej75YhYwxhcTRdRZ0x+SYFkp7XpZMpA3N1TU9w7R1j?=
 =?us-ascii?Q?qZNij8nU1+G5/u0T3UbhX1oMgRvAcHzRQU4BOx3KxvQ6ELc0VRS7WD0dO3zu?=
 =?us-ascii?Q?vUh0S7gB/SqFi/X6kdiuz0HOHxZGv8kmn9w905C4mYD8GGbAcIniz51nUrph?=
 =?us-ascii?Q?SpUxpk85iVHrrTBtAaQXCXe8xV+vgc4zbb2nWjjmJ4GZsCT6zWkl0OXlw0E2?=
 =?us-ascii?Q?iGI4Hrk2yMG8RDCBkVPHXYA0MiDcqyrRtMbYm2/BNIJGzs9MBUh9rMzV1Q0x?=
 =?us-ascii?Q?0ZDY/yIs4y3yPw7aELkXIQc3VQET3NKyDh6bI8vVEq0JsdqlV2LHXrukKh4T?=
 =?us-ascii?Q?bmII08xa8M8xbgDiRQvqSfuWSMj9tGpzWWVeNEhec0XJdtiatIQ/mQGIX3ys?=
 =?us-ascii?Q?aD9uw3n32RfSVLIG4UHRgQXcxDj+a7pnN/jJROeUhSgCRnK6PxP2?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2499889e-84de-45bd-20d3-08df40dedc6e
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB7280.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2026 17:03:24.1281
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v1A+zcb+OnFT7cysD+rASvh7y61X9y0NcF0Ni9Y/MoH2j31i6ULRcpy6GNQvuPB5ST/+FwwmEYBBqAF8sWTQ7u4tNdsxxwtz0dZF2NCdJUls+sacH+Yu+VTowpzioP67
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6783

From: Jeff Chen <jeff.chen_1@oss.nxp.com>

On Wed, Oct 28, 2026 at 10:18:16 PM +0800, Zhao Li wrote:
> Stopping an AP while channel-switch work is pending leaves the delayed
> work armed. After driver removal, the callback runs on freed driver
> state. If the AP is restarted first, the callback switches it to the old
> target channel. Reusing the interface slot can also reinitialize the
> work while it is still pending.
> 
> Cancel the work when the AP stops. Interface deletion, type changes and
> driver removal all stop a running AP first.
> 
> LLM assistance was used to find the bug and review.

Applied, thanks.

For future submissions, please consider keeping the changelog more
concise and focused on the bug and fix. The discussion of possible
consequences feels longer than necessary for a patch of this size.

Also, there's probably no need to mention LLM assistance in the
changelog.

