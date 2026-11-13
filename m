Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794586793;
	b=AbHL33R7Gl7IzH6TkBgiUfUbyp3JQ52tC6AklgpeWLSZ2rL8c5xPUHX+b55gRfmguBX6
	 vMf3n7TzqHIw/PYNDGbRuKOYUbFcfI1AUw/fAE4c0nwZSF3HUbfDFCtm82oXAHj5aU5S6
	 ylj3F0Rn6Kr4/RlST/GHrNxYSJofFxmOjFhdHQGbtJA4vKPwwQ2HlFZhg2peFD+7z+b1n
	 dhnY6B7G2xd+gm3JcJ1+H1SY1AL7zsprYyzScTQonOizZkmivY/SL1bU9QUwkTZ3Pmhsf
	 45YoyxfmL+8vVqUMP6n2zG4+PBthHXuAVd+o3LvRPXfjRAtQmcWtHfX4p/zwyKXqkMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794586793;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=HUnXlBqyFvpu4qanRZyKH/ebVH02DO8XkAFnnlXJUyg=;
	b=Y9mWTcsfxV5/Cga4QPScZRFE/D+ysXO/XM5jH/ODMgKIokanGP03xqdZP6m33Hsv1skp
	 /nT7qZnJa4BNqTPhNR2Ybjgh7htvna7h6bBtnN+J6lcrn3DPHnHf2huZMF2DcW3cC5p0R
	 S13267JG5JXt8uEfD1vyH1SFDQreZ1pXGGLP+BYofnefy7MrKnNKpZ7rbsJpF8ccZkPj9
	 0+EQwml6kgFbDdZtnUenJnux0PVhENc9sHX7zmu4CY09fZaGfwSrmP6x52I/hyWDRHV83
	 nzO0EgsZbhtdbaAS0eZIXGl/VCnL/Ip5BjAuzO2wrxI3yfjlDtVc020kUgEyUtx2IVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=H+CoVCc0;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YhgtSIV2;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED1E7606A33D
	for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 16:19:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ED1E7606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=H+CoVCc0;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YhgtSIV2
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADFRRbV1725250
	for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 16:19:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HUnXlBqyFvpu4qanRZyKH/ebVH02DO8XkAFnnlXJUyg=; b=H+CoVCc0fzXgTQG7
	NWJgbcZj1laU4Wc5tO6wF8eVFX48GlkBKQQkXexNhNaDPhq0BS8/fRhSQdkdnJtE
	CQvA4TWlWF6XcZB20SoNBxoUgVpsyCspA53Xd7bpzuN7aoUOG/KW/BqWHEloDDb2
	ytKhMQdFSS/kcA9+O/yLOT6L6Uo0JtApOc0mBbAXCJGL6Pk8DHyi0bkSIgEbK960
	Upzm4NsUoqXsBH9if/V7FlAS+KWMwey0sAF6594K+qRo5zZfcxMc4rnPkvMrkPV8
	JRYu0pJXhbT7iPC4D8n/k+Kpx1M05JGmzB8dTccw2VG0kSmSgM8C0rsk+hJBu0yE
	KkDVmg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hx1bp94r2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 16:19:51 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9495dd0f07eso90647185a.0
        for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 08:19:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794586791; x=1795191591; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HUnXlBqyFvpu4qanRZyKH/ebVH02DO8XkAFnnlXJUyg=;
        b=YhgtSIV2Wdq8awNCTgNG6KBkFpAotR+eLWuKfnhNxFVg25RmyquhgVM/kJiE6nU8yU
         cFlrlWSOzJ4ujq5uu8W1yXdrZa832dMoTrf9rgMocbetcXI+JwZiNIdL9NHSrCXTXI1k
         BlzY3Uu6BqSOJY2+2HTBeGpQ5KFTrkbSx5Gi+bg09KKJtt0UgY4hPXtVJ6CHp7z/ZYg0
         H87AOw4Hlbbpn3VKXih1YvEi9WMJVVkcIpHrwXuURiGZX2jAgleQRGI8cmzgBSYF37W6
         QHQJcaymIV9xDcac+CtEEEjdgPrNFHpUnrrPsGE3u9mPiwKpKsEFxFX8yaKXZ4Cr3c9b
         +oDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794586791; x=1795191591;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HUnXlBqyFvpu4qanRZyKH/ebVH02DO8XkAFnnlXJUyg=;
        b=f1BmwG7YJk064DzbRB663NcGrNylEiw3EHH/wr+PYL0huYpfb11yXTN/y+wE599mRU
         xfrkHqZNXJzhQlAkEtI8wONW1HGla9nO2LLKhvT8XgR+75Ken8z7Q2HAA4AalqPDG0Ds
         rMPYbfTxNSYKNkIXW0O50BiR+SoPLF8H27jMFjsr24rWOee39hDbLdsFkiXJDS7xFLae
         ZnoPW5o6wX3lj3lNqo9OrX4YDVd6afMo+kNaDNkBomdZsAXIUihApkVEcj4Wzy7IuMK3
         08wVi0AzFqcq4Iih8bI9rK2mZ/tKNSsXoPjpl9uIHkbSsZAd5vWdXjk+jxYF6Oy4G8N4
         g+Qw==
X-Gm-Message-State: APuU4Z8BLwQEjMa9xdSYaFgATczjObo7FDDD5cMNUCRrx2ROftomPNUf
	PEwBOIRPEj0D3TGJGaVjm4Jl29stYCZVrSmNFUMjzlalXOZjmgXGhJUreX/faoLCqu6Vtyu7yMj
	hsTLMRJ48wzHnYAcVJ15IRNfo3olIFf/OnAUDQlMJzaA9NirTxxWZGYbTngOMagMrbHFNNQ==
X-Gm-Gg: AYBFou1gX7jrb45PGZs0mevpZoBaM2q6FX1T2a15AoHDfYuinyQ128Weq2lorCMIaXn
	PS3KerjCCGTd/gwXsVjcXqzdFEzXUH7wo7gb8JqFWE8vthDZ7xyvW4A7+F0BeIbekE3LLSqxnUE
	wUr5DLBr3cFzSmDNUQTDXRaBF2lBbw7ivbbDIff0KtRlnwYJMceCOQJPm5pzUv6MDNeGUm3aWcQ
	muda90zq4uWfLXT5NIK/DpHkEZOGh2eppI1vMpx3Yjq/tMFDCZ93rIC8/l3NuwAgBjY1lzOJYeF
	5CMHMFY12CkRSz5++RP/1+Qnn1DpO62AiMKqMVtXiLr1QP/x3RJ7Xc4tjb1tRm9Tft17WoT/HXk
	GyFiTY+Q1OmMRvnXJeNdiTTG/ed2dPHs97c/S9Ek+MbagqnVxY3gEyVtYYVOBwFygmUot+XKu/v
	yRptOgXbH4q047XpVE+9BlDK3MK8qUATKKial0ehUrBpdu+jzPWeMY/zheFJ2QP1oOikA2lfbv0
	Rtn9RvUP5gdZe1j6MiNyoi6ZoIzsyxg7NJlTBGd8bEupm542w==
X-Received: by 2002:a05:620a:17a2:b0:945:f5c0:a63f with SMTP id af79cd13be357-9494b9c59c6mr497082585a.5.1794586791120;
        Fri, 13 Nov 2026 08:19:51 -0800 (PST)
X-Received: by 2002:a05:620a:17a2:b0:945:f5c0:a63f with SMTP id af79cd13be357-9494b9c59c6mr497077185a.5.1794586790563;
        Fri, 13 Nov 2026 08:19:50 -0800 (PST)
Received: from [192.168.1.17] (82-64-236-198.subs.proxad.net. [82.64.236.198])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095a5b93csm117938066b.5.2026.11.13.08.19.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 08:19:49 -0800 (PST)
Message-ID: <097baf2a-a514-4439-88df-8519d4b13bbb@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 17:19:46 +0100
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath10k: add hw_params for Atheros QCA9377-7
To: Tomas Paukrt <tomaspaukrt@email.cz>, ath10k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <5b0.ZbQt.6HOR0C2EfXi.1csPuN@seznam.cz>
Content-Language: fr
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
In-Reply-To: <5b0.ZbQt.6HOR0C2EfXi.1csPuN@seznam.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=W9ytxhWk c=1 sm=1 tr=0 ts=6af738a7 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=MDeckJw97qnk8wCBExTehA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=MnlbyKH6xQ6dLdSUnEAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: nzXUiry9fevS_wwWw1AyN43Jw7A6Wl9o
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA2NSBTYWx0ZWRfX34nnxOUrKh5N
 lvPo4gRhJRkREDdU2MMcLm24Kv5G6GnimX6RwyxaX4+ahYHGk1ndsmEOcL7IAn6DToyfqF7mY1M
 Eva0SSgu3gi+DnKWnxi1DzdgZpftnAg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA2NSBTYWx0ZWRfX2ujGXLU+BIry
 vAxE8SGJ2NbWj1M3OdURfPDKnSmF//ti7vSFCjqHi/0gxPTJaNcD2H+mqS89c1Ffnu6nbMf/UQk
 LQ8K8RumGQaR5Dfi0Szy3PuZsc4lUHopSZNQkfhPJvEc45HpoD1R5TKgZH/bbvfRpJDgyk7M7U/
 boyumjB9qtqQ6u2P4Jt5vruIF0uKIe7c/Mz+lUWCD8fwKGILkHexAuVVWixQfmdsd2VuHUBnsB8
 TmYO6OCZJbVDjEfNFA5wcDr77mbU/WiFM+LUC7bJe1lbitTfOYStCXvlljVRu5HQFnQ5GnIU8am
 PWztHG9jFqXpjwwfy9b/O4yoZ3gGfE05EAEXRTQiQ34tWem92+IxBQFwxIcYIWYb0zC9fZr0tLy
 Xutbc8uHhFrtY+ofuH/7T3DOU2bWUI/SR0EmM2r5q3uCKukY8Qm/2MgH8eaIgYz21wpGjwddgmh
 T1D+wcX4Is8FVVAbiJg==
X-Proofpoint-ORIG-GUID: nzXUiry9fevS_wwWw1AyN43Jw7A6Wl9o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_05,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 adultscore=0 impostorscore=0 clxscore=1015
 bulkscore=0 malwarescore=0 spamscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130065



Le 05/09/2024 à 14:03, Tomas Paukrt a écrit :
> Add hw_params for modules based on Atheros QCA9377-7 chipset like
> 8devices BLUE bean or SparkLAN WUBQ-159ACN.
> 
> Tested-on: QCA9377 hw1.1 USB 0.0.0.111
> 
> Signed-off-by: Tomas Paukrt <tomaspaukrt@email.cz>

Looks good to me, this mostly match the PCI version, except for fast 
diag download whichis disabled here.

ATH10K/USB anyway experimental, so I assume it does not hurt adding this.

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

> ---
>   drivers/net/wireless/ath/ath10k/core.c | 42 ++++++++++++++++++++++++++++++++++
>   1 file changed, 42 insertions(+)
> 
> diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
> index b329428..e2ababf 100644
> --- a/drivers/net/wireless/ath/ath10k/core.c
> +++ b/drivers/net/wireless/ath/ath10k/core.c
> @@ -629,6 +629,48 @@ static const struct ath10k_hw_params ath10k_hw_params_list[] = {
>   	},
>   	{
>   		.id = QCA9377_HW_1_1_DEV_VERSION,
> +		.dev_id = 0x9378,
> +		.bus = ATH10K_BUS_USB,
> +		.name = "qca9377 hw1.1 usb",
> +		.patch_load_addr = QCA9377_HW_1_0_PATCH_LOAD_ADDR,
> +		.uart_pin = 6,
> +		.otp_exe_param = 0,
> +		.channel_counters_freq_hz = 88000,
> +		.max_probe_resp_desc_thres = 0,
> +		.cal_data_len = 8124,
> +		.fw = {
> +			.dir = QCA9377_HW_1_0_FW_DIR,
> +			.board_size = QCA9377_BOARD_DATA_SZ,
> +			.board_ext_size = QCA9377_BOARD_EXT_DATA_SZ,
> +		},
> +		.rx_desc_ops = &qca988x_rx_desc_ops,
> +		.hw_ops = &qca6174_ops,
> +		.hw_clk = qca6174_clk,
> +		.target_cpu_freq = 176000000,
> +		.decap_align_bytes = 4,
> +		.spectral_bin_discard = 0,
> +		.spectral_bin_offset = 0,
> +		.vht160_mcs_rx_highest = 0,
> +		.vht160_mcs_tx_highest = 0,
> +		.n_cipher_suites = 8,
> +		.ast_skid_limit = 0x10,
> +		.num_wds_entries = 0x20,
> +		.target_64bit = false,
> +		.rx_ring_fill_level = HTT_RX_RING_FILL_LEVEL,
> +		.shadow_reg_support = false,
> +		.rri_on_ddr = false,
> +		.hw_filter_reset_required = true,
> +		.fw_diag_ce_download = false,
> +		.credit_size_workaround = false,
> +		.tx_stats_over_pktlog = false,
> +		.dynamic_sar_support = false,
> +		.hw_restart_disconnect = false,
> +		.use_fw_tx_credits = true,
> +		.delay_unmap_buffer = false,
> +		.mcast_frame_registration = false,
> +	},
> +	{
> +		.id = QCA9377_HW_1_1_DEV_VERSION,
>   		.dev_id = QCA9377_1_0_DEVICE_ID,
>   		.bus = ATH10K_BUS_SDIO,
>   		.name = "qca9377 hw1.1 sdio",

