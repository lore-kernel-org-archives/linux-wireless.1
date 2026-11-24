Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.83.6
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795491859;
	b=HzloIFzWyT804h72QiYBq+zXAqyBxI2D96Tc3zXHsscQJRMB0IiuXlwdWgUTjPWh6eUs
	 sVt1FGmfiWwq6DU+m3UbjU+Ll22d/5dGOmAvLu4RWDA/aE4WSZCmdsl93dsSnHm5fpLgK
	 PawDhDGyNaX3QayIMyKkyjYms2sMlZofhpOXeoJEq5XLsvZqJB5T5mTx2pyI50FBNfHPO
	 kBmBaZEa9V7B0qclmJ07bZmq0KOX52XUBzxfIYqZDap0s1DDOToP3anK64LIoxpi/3VcD
	 d9AFFQrjEHAG1z3Ph5Sax3ktp/lHfSY0CG/qtgW617A4xZzO5d3uL0bhQEfKxEP8duA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795491859;
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
	bh=RSz0GlJS9CQO78poPa0IJFftAjHkcqE+Ug7n4l6DeZ4=;
	b=Tm0P743FQyUhTAl0p7N7BDpQEKC9JRi1jtYEAaUTZcWtFch8ZeghlPwCjf787dfVZIJC
	 8Z4GiV2XOursrZSa8OOGYIOaUv0y/qRqpgTg2ITsDnDovTtq34kPaPmWFfskq9OfxLATZ
	 QEqf3srPI+JFGN/EXmdO9A2W4hZDNoGCH1Zd7bPH9uTFs6S+bpEjwyKgzIjo5lG8UaB3J
	 r2EOF1y134WUEftPQtjlwmp63IvH3s42ZN+o8oy9Z8TF6wBfP+ylNiPYiK3JdckgRv8uV
	 /ztND6YQbBKGpo/1Wt7qlpoejKj8i5dQoe1sucouQPP6SoZlyLimezCRs7b1BUOqHag==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b="uk+Jp/Rs";
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.83.6
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013006.outbound.protection.outlook.com [52.101.83.6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB1EA606A31E
	for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 03:44:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB1EA606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=uk+Jp/Rs
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BSnu+0Arc9DP7T9aArwBa1HMaV7HZ57dCZHOmhUuRMsMhf7U5KTECGPqHJpzrszWPWIWLUfFMiA6ug8hUJJDATRShvO5Sc/TLG1ZSYx7aMACwP34bzm31TRC6+F7JuBLMq0I0vjpof+6cGJZqM7rB+5ZHko7BqMRG23v5eAL5UjWMhRe4txs2AXaX0INY+V+JYUTO5MUzSi93WifS4RB5Yf+JXMjhTZ77J2iDokXO5m9DzblclXR7sb1qIeO5tUtR99fuB7KYSzskQcVJIWJdGhXvWNezp7v+RDjv2YiaC0pC8EwO5XQicsdd1rsKzcpcAMYaSU7NpLuc2YO+OS/Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RSz0GlJS9CQO78poPa0IJFftAjHkcqE+Ug7n4l6DeZ4=;
 b=aBEwifWNixiUGB1jcJ64CimUtnQrG2MNYkxPhn6Pf/SX9R0rrzIdetumhBdiNHskdB9bmnvm43Y7+AMXAbvPaIVkmzWvP6tuD5f0anr4vaatzVTS4X2sghCshM2GaYgEJY3utMSVmkaodg3fgY66x1woSqM1MBJrDyvM0igYllLc9bPuGHh3q5h5/tmRmPH9Dzr3K+gXfWmi8/nfkX6SlK34r96ad6S6BfQ4TGyznmz74SEUmNdLlRmkv7Em712neKItgcghqZ+xWnMNVRhKOfEzzU0nnbiJNogDi9J7mcd+uNvdkJr+YPnSp6Oo534srZGj7fFwDS4sew/kMWsObA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RSz0GlJS9CQO78poPa0IJFftAjHkcqE+Ug7n4l6DeZ4=;
 b=uk+Jp/RsUKektlzAOFAmYv0kTmErkeNxXuS5Qrxjhw85JiC8Q6AXXXtAxSX2gCYwwoNziM5mjaJtKj7vY4Nr09R0JMGNCuI4lsBOYrefZpxepNJuceNBzUq+4FuMfe618pkf19y5uL/0ZSAWsV11gBJ8BWuSURsNsYha59arWqyH1R5eTgp851lMJTmtd29gsgR7V10/djTPWcE8zG0VayjrvjCGZNfT7x4EsJP//0EZMkAvCGJFL92YecZqTRLJt55bHzKJ24VHocQR7mGVQ6YNaIvuhpYHzNFD7eg2RL/ubthTjHIPj2r+JUb2j1HRhFVvK+brEP+rKqYHG4zhNw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VE1PR04MB7280.eurprd04.prod.outlook.com (2603:10a6:800:1af::22)
 by PA3PPFBB9BDA27D.eurprd04.prod.outlook.com (2603:10a6:108:1::b0) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Tue, 24 Nov
 2026 03:44:15 +0000
Received: from VE1PR04MB7280.eurprd04.prod.outlook.com
 ([fe80::92fd:f75a:a302:f859]) by VE1PR04MB7280.eurprd04.prod.outlook.com
 ([fe80::92fd:f75a:a302:f859%4]) with mapi id 15.21.0639.012; Tue, 24 Nov 2026
 03:44:14 +0000
From: jeff.chen_1@oss.nxp.com
To: Tristan Madani <tristmd@gmail.com>
Cc: Jeff Chen <jeff.chen_1@oss.nxp.com>,
	briannorris@chromium.org,
	francesco@dolcini.it,
	linville@tuxdriver.com,
	linux-wireless@vger.kernel.org,
	Tristan Madani <tristan@talencesecurity.com>
Subject: Re: [PATCH wireless 2/2] wifi: mwifiex: validate command response size against buffer length
Date: Tue, 24 Nov 2026 11:43:15 +0800
Message-Id: <20261124034315.796937-1-jeff.chen_1@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261102135930.701845-3-tristan@talencesecurity.com>
References: <20261102135930.701845-1-tristan@talencesecurity.com> <20261102135930.701845-3-tristan@talencesecurity.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0016.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c9::6) To VE1PR04MB7280.eurprd04.prod.outlook.com
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
X-MS-Office365-Filtering-Correlation-Id: 67ebaafb-94b5-4527-213f-08df49dd359a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|19092799006|376014|10067099003|56012099006|11063799006|261021121427099003|261028144727099003|261021123027099003|261102123227099003|261022105027099003|261026140227099003|261022075727099003|4143699003|18002099003|22082099003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	EM5h0fvuSKAHCZZjqsTJTqq6RaPZkr3zIcF+YFSAP309YMgs9mvFoxDQeLNoxk5NRr4SarXn+46GwwuqplGY4JDQoQ0PbGIJ+wMhZKm3qfxHDa5jkW5PecuEcFM8FvVsn5UnUNAfrP3dc/tWCUqT82PCENUDwKUrQJbE5TiauLAqtSKWSBtLIeXF2hY+3OWtQukVpHxHYxIIPmY+dtOxSwR5Lew+KBpVySW4QevTJPYNpbclpk3YTBQZA1JkZCBXSL/R1eKA9kLbMV5dINBqGvGX7vMitN3h38BF2ecpnh8vP7X2C5KPRRCMX2KY9LRmQX48BzV7Hnsl+o0/BNLvBg9GhFp5vHdGtrMs3pm3vtbtmf1OkR+KXUVWCB1fkL5lR3yU6Ei1G08ELY19hzB7aPW9pLDRB1T5dfZHO1OofxQhfH68QWyQmQiEIaCkD3pGecpo2azqKJ2lp8EqejVxD3neEKEvWap46WugSd8Aar/83nFHMRvARs74efbcUbWq6OHnmm0mE/hQCKjfL8fsNDa7/yu1rylQ8y4r/mgGJHABvUoqWyivsHdW/RonH7+ifSnB8KvsoEDMCQ16RHTIjwKgMk41VpeK809NXsmMYvEVD+86d7zcZSBjSrcd8zx158YOg83Y8c+UuJuNMFW01C3gQCKMZs/VjGx0ljjV2Pg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB7280.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(19092799006)(376014)(10067099003)(56012099006)(11063799006)(261021121427099003)(261028144727099003)(261021123027099003)(261102123227099003)(261022105027099003)(261026140227099003)(261022075727099003)(4143699003)(18002099003)(22082099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?6is8PNcEAmdTVLaohtlefwZmrYe0ar/VJsEyONqNAmtXwzB3wiu4klgNmKau?=
 =?us-ascii?Q?hO3+9ET5VrCJdH17cX9/KFOfUjQ9q+RHM+KR6Ndo46QTzdyQ+k5htHPplAco?=
 =?us-ascii?Q?/mcdc0EUeM9pu2syWtScnIwmaHW+YioPCrEqr+y0Suz4r0568fyysUyKi6Sg?=
 =?us-ascii?Q?6ak0VJMHl56PHL2MO9MoCLS3xyicYAtzNuO5ZCBA6d8OWOGOC3qT3v1mtMJl?=
 =?us-ascii?Q?NOYtzc4OoVTu4PGeqBpFnzJbIF57N93OiGYVD1qWSgjKSFjkFU52rDdK4Rn6?=
 =?us-ascii?Q?6NDdmZGW05yqTZmAmF+b1r1q2bjQ5/RJkZg+JyLSVZ9MFhHvXy5tB3+dJn6X?=
 =?us-ascii?Q?48eUzkVKQKmm4V+NtEKlNzIicGkLMLY9tZOzF/drsdkQe6jSuzYpdvL/h/Od?=
 =?us-ascii?Q?51iWU5G8O/zQRrfDHUHDEy822oIHCR6cjBEiNJSPSUT0goeEgZoFo8RC8jaU?=
 =?us-ascii?Q?KtFQt0brFZS6T2vGF23SVDUI7Bels1Non500Aw/vjOXG5mtIZats818GYH0P?=
 =?us-ascii?Q?gCFLnxCYH/pflRhyfoSdmMsxdby8faT0N3TSagVq62brpMU4AecQsdF/k5Ss?=
 =?us-ascii?Q?taFKcX68wup1saj4uSjqxK2QbHDyvHJ5Z30ivlybeCOQWw5bL68eFeP0L7kS?=
 =?us-ascii?Q?mf5XwTlfqrTUfXkxFy44g64et6VXnJIZgjREoEfoW9/t+2zVnvj3Mmlp+y6T?=
 =?us-ascii?Q?W50iz/3ioyWNoefGp42jZudNo7MvCzupMuinMO3aM5wqc1kdM7iKs/m7uMBY?=
 =?us-ascii?Q?FhG2PekaZh1GuQZd+6EiOBJdB80XOvBEtIrf6Ke7nmAmT6L9awI/qVjNdfad?=
 =?us-ascii?Q?4KruM29Y4Du0LJ4ggkVfPrZ1pb0l36SYdmNZaukdEnSWyqSEN4sS97rx8ZwG?=
 =?us-ascii?Q?PMxs3Ex4KNH6VIee2OIENOoOm6Y1zxpvumVELGUcBtA5FKbX9lhVgqYNPBuM?=
 =?us-ascii?Q?CRBBfxoJOygwZjYsb5fll5GE+rQB7vhErJYZfMhPHWDwaV//duv0bP7mFe7H?=
 =?us-ascii?Q?ffXpFbh9hydYtVpVGruOiwMDEG8FMp892QO7Mmw9XO+FyIunp46EmrFqPAGq?=
 =?us-ascii?Q?Fh3mgpWaaiZzoS6wSzV/PsyGem8k2kQcf4/K+KgrHrixsRoiP/0O4077qbKl?=
 =?us-ascii?Q?9AV8ZWJZPylbZF3mAJaTMk6PqrtFWHQJJPUyj5WDkN8XLeDKD5HoC7JiGtqm?=
 =?us-ascii?Q?+mhfdq1svMh4EYTKA1SCufjLNZjnW+RDl3Hz3HnteSRG4J4YQRnM+esZLZq/?=
 =?us-ascii?Q?wGg2oZXYIZcYCj7r6/VbAoV0YngECXsmhOzJzXDOJOLNSeLpG89+D3DX6yX2?=
 =?us-ascii?Q?MX/bw+X3rgHpnQ0csgfTX70Kpc94jNtnk6PPfI8OSVmGurGx0jY5TN+LZEgY?=
 =?us-ascii?Q?TO5HAOiLhRWaWZAF/f4WmJ3WhDX2iSz5JZxFT/4oplxi9ypYiJtGUzQRt0HM?=
 =?us-ascii?Q?EAxbtcUm1FGCQ6kbebw9YI/vdl17EsOL5lJKtv/TUaJ1jXQr1xsh8EiuTb8c?=
 =?us-ascii?Q?SdP6S/hK2ma3pGw7ZgzuN2xNBy+QYHYrwUhTX90ccTUYUOidzUAZ+2mHnyRN?=
 =?us-ascii?Q?YSqUrM6fC1bmKnj5k/uueP+GD683bRsbE71hiGmYwf9+dv2qeCvUYb6FgL4k?=
 =?us-ascii?Q?57jtdiAKTpc5z8OK+IOf4/cpwz68hMP+5nBtmSJMJHOeQ9u3qe4Uq4dYbscZ?=
 =?us-ascii?Q?MqevaFmCJ7abY4EQUfL8ulw8LMpusJk3IPlaPkPdkxOR+8KI6TtVRVL+hGXC?=
 =?us-ascii?Q?dOBbfewyItakbRRIhPi2zlmZxEedTxLN/+w4QbT2+v2ApUFpLOpx?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67ebaafb-94b5-4527-213f-08df49dd359a
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB7280.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 03:44:14.9088
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tmy9hY8hrZVnaIH9Ygy/rPr7gP22MseD8lSGqHwrVkFo4ilrzeYkqgyNscOUia/9Q03QJH61tR1kTaOh+bizMhqyRQivSL7xPQn1QcOfC5C6wvK0XFoUVYkV5eQvsJ2R
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA3PPFBB9BDA27D

From: Jeff Chen <jeff.chen_1@oss.nxp.com>

On Mon, Nov 02, 2026 at 01:59:30 PM +0000, Tristan Madani wrote:
> mwifiex_process_cmdresp() reads the firmware-provided resp->size field
> and passes it to individual command handlers that use it to determine
> how much data to process, but never validates it against the actual
> response buffer length. A firmware response with an inflated size
> field causes subsequent handlers to read past the buffer.
> 
> Add a check early in command response processing that validates the
> declared response size fits within the response skb.
> 
> Fixes: 5e6e3a92b9a4 ("wireless: mwifiex: initial commit for Marvell mwifiex driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Tristan Madani <tristan@talencesecurity.com>
> ---
>  drivers/net/wireless/marvell/mwifiex/cmdevt.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/drivers/net/wireless/marvell/mwifiex/cmdevt.c b/drivers/net/wireless/marvell/mwifiex/cmdevt.c
> index 6e04d7da62179..f59b53c2e7b5f 100644
> --- a/drivers/net/wireless/marvell/mwifiex/cmdevt.c
> +++ b/drivers/net/wireless/marvell/mwifiex/cmdevt.c
> @@ -821,6 +821,20 @@ int mwifiex_process_cmdresp(struct mwifiex_adapter *adapter)
>  	orig_cmdresp_no = le16_to_cpu(resp->command);
>  	cmdresp_no = (orig_cmdresp_no & HostCmd_CMD_ID_MASK);
>  
> +	if (le16_to_cpu(resp->size) > adapter->curr_cmd->resp_skb->len) {
> +		mwifiex_dbg(adapter, ERROR,
> +			    "CMD_RESP: resp size %u exceeds buffer %u\n",
> +			    le16_to_cpu(resp->size),
> +			    adapter->curr_cmd->resp_skb->len);
> +		if (adapter->curr_cmd->wait_q_enabled)
> +			adapter->cmd_wait_q.status = -1;
> +		mwifiex_recycle_cmd_node(adapter, adapter->curr_cmd);
> +		spin_lock_bh(&adapter->mwifiex_cmd_lock);
> +		adapter->curr_cmd = NULL;
> +		spin_unlock_bh(&adapter->mwifiex_cmd_lock);
> +		return -1;
> +	}
> +
>  	if (adapter->curr_cmd->cmd_no != cmdresp_no) {
>  		mwifiex_dbg(adapter, ERROR,
>  			    "cmdresp error: cmd=0x%x cmd_resp=0x%x\n",
> -- 
> 2.47.3

This error path runs before timer_delete_sync(&adapter->cmd_timer), so
the command timer is still armed after curr_cmd is cleared.

Please move the check after the timer is cancelled.

