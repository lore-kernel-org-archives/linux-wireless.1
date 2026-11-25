Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795603714;
	b=FJ0S9a1sJ/jnsyByAwLNGGaAB+How/gx5FOKfjTOJ6KFgnuuGfup8QqiA2HyMUYbYiDj
	 ACkLEKnSpcOPFLpMfYMcAm+jwnH9+IlyibXDurw04MXfAdjjxlrTSv2TKF5bK2VUUAN8W
	 l+Rxh5dkDHzuOd2+/ncddgAg7hox1z80ii3tKZbC1P1RRVTHeKUvs2Gx/qOgON1v093Md
	 PHjKRgTh0Xe4YVEEOdLoS7cE0Ak9oO9JMvnY92SXeZMWA8VbTkhiFm6t591muzhV84kYc
	 78fC14nGf9UlMIFew5FKAZe5FHVukeK9Otxe9ldoExlWOyjEXHWzZ6xSfKwdSbKpKXw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795603714;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=o6PzOb9P2But+Hib1lbIe56slQsL0ICH0XopSwOlC5U=;
	b=wkUCSAGVz5Apj6XezOZR5Yji5QKwRG5AvCE2rGybL/TbsxjALtJzAKwpkdpsZPani6J4
	 nmxIic4geAB5BoOkUotKBz/YTOIFjkoMtWWNo14brg2cx+r7gF8dRKtPPDyVkumrpZuMX
	 wd3am3DUFdrWh36KBvzp6JgSkdqqgbzHEHwubk1wvSKq/6m0/hKo2qYQwGY66/OCmmjl9
	 M9nxDETv4HMjegv6uL9DEKC+wMCbEZrdLPa121ZrA9Nhz3bIUTgzMW2TlsN/5E5aj64f7
	 j5oX93rKh2Amk9BbFPh/KWNfLTQeDESTkGhev+X7Obs1jQJATlyFEb6gLVGpp28jm7Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DbzNvsM0;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OFpkcarE;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3862A606A323
	for <linux-wireless@vger.kernel.org>; Wed, 25 Nov 2026 10:48:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3862A606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DbzNvsM0;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OFpkcarE
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9nkFb1505230
	for <linux-wireless@vger.kernel.org>; Wed, 25 Nov 2026 10:48:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	o6PzOb9P2But+Hib1lbIe56slQsL0ICH0XopSwOlC5U=; b=DbzNvsM0LvusNF6l
	QvFS1/spLqGnWgnLq4Ss3m2h6+l3s4S94ycHqjJQimdBHfNzvZYOx9P0j7BMuEHZ
	ejzksKnZZa8AypKqOvGHHeg8lcPe+vXZTiEsu/ZLwE1se2JMTr9HzoB6USZqykH2
	CAzWeP2PqjicEDp4J8BHyBbCiGYHdi7JtzC39SmsxaYbvbOFUN+RfV8UW3mm/XF+
	pXXHnAOTA+Y6EPAi0GjrSLf9LLmIiVag3KamNFtZIhdCbRpv3kX3xZkq1YKR3Zdk
	vCQIlG9GUyzRAiAkNiG0aWLk4ibhYz5/wZCa69x3m47k5UHg9H/D4zHIbkniOmAi
	PuKRgw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5qa29tqf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Wed, 25 Nov 2026 10:48:32 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-94961511b61so927733685a.3
        for <linux-wireless@vger.kernel.org>; Wed, 25 Nov 2026 02:48:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795603712; cv=none;
        d=google.com; s=arc-20260327;
        b=NRZ7KgxsR4K86fYWxZeIz0/GGDfjIBC3/p7MOHdv2DxmD6quIqa159B0X4ealMb4OB
         lQDhdtJNpoN23zJ++JbJcGyjHMSmEXYY5uwdhmI52v1a/QdzxUGgFg/xRT8XjdAN8cxr
         2co3VzjFkXxPd5WX47JxkjcPnEtHpuNimlLX4NebPyY83qpeATKxJHnIZhZP+4QH2RMD
         ULSlQWKbJa0qiURAirQg1yvy/IBWrmlbQO0CDgiTD2VbG1O7OWhZPrWPUON0EKfn5GLu
         JWhBOMawU6Rzwt5W9PI4ifFJ26rf96t8/hnUet4fXuv0SJZIiSI1x70/yhzwlMohQ+gd
         ndzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=o6PzOb9P2But+Hib1lbIe56slQsL0ICH0XopSwOlC5U=;
        fh=8XZKA45/ozNc0coo7OTEeneygDKSV+iXOW4AWzLQh+I=;
        b=YLu8UHGPrMLnK8mdsNuCRuMuaQm03mDrEYgkSGScR0YujJMK7pGgIh6h1m4XvLwUze
         HG9FF/PPwtDscWq123BeaBDvH1wvMqpEPjL2iZZKNboid9G7LTOltKNmj/yZaXONFmSV
         z1tRurVA5+Cf227JbePQpa0r1CBMH6uZy7COeLftg7iPozP1whtAHhKlSC7onm/POkbn
         JZSN2AgrMpdYm1rqBfkCVxnu5Y+L8RLh8ByvHCFXaZF7xHhmBpwFoARLRACMZqilfYDZ
         Vqh0t6OzzPkGy9DJpJ42S+XEtJ6pJrumK/CmYuIL3kRWDra5Q+rBl92S5YHCFG49nsib
         tvrQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795603712; x=1796208512; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=o6PzOb9P2But+Hib1lbIe56slQsL0ICH0XopSwOlC5U=;
        b=OFpkcarEGjGrej1uySxOQHpiTLi+Sgb9PFwxhUI6+3oelAf3hZiyFENVdxElrCKJiW
         iUKZ4TUpBvI2tCVzJrQIV4yEefdHHWtc+SAGYlnbxT75zSP7ChvUUR2tOw2MEiU8EbwQ
         487/f2y+0G6ngKx0dYSlEr41CWr3QYsWPFTy/bPmjQvG53fpX2bJnvi0xhXNCk+zLOr2
         0AJHJ4on3LQaPJRg/7FeeTe5PPLKunSPlMcw2rWog2s4lIzJIDDCbNsl846r0ODa9JLg
         o3NQPpIjeI7B+auBWxhxoy5PIPV5l351I4Q3+Uz9zIrO60kkCCDRqi3A7zem6Ux6n1v0
         EVWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795603712; x=1796208512;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o6PzOb9P2But+Hib1lbIe56slQsL0ICH0XopSwOlC5U=;
        b=xXzTE7gyvxzcUrVTJVlFm2dHITn32Mmy9LEv0VSx6Py+doRoWxE8isCjefZr1ZmeYC
         hUm+h5otcnHsdCmcAopzC5QfkcWp1iDxe9y/5Y6ZQxpAhtbYmhKF2EgcvRAvMB+tb607
         4HgT0zVCkyFcAQRmvcdFXiYj/lRKbhKc0LUF/U04HJWhlp/hDznqfDit3CLhCK2V8yNK
         zc3m4aLlQ4q3w8upVVoh4YRNcRCJrOCIc6rnbbAiOPJWYR6QczTbI6U7pt4VWMf1DmXn
         exkpukaLV+Cfvf+Ep2fFxYFWM2ACv/dD1VbiqBHCZwzcxm5faoOwzbm1jooCNj1LAcfU
         4aqQ==
X-Forwarded-Encrypted: i=1; AL+hErFI2weUS9zvZJqIsnhLaOz/mMREjvAuZK0pgQ9+ut2/mR3zYvpCWhreo/5jWgPkVazf6DAAhdjMoLJNbuL7Vg==@vger.kernel.org
X-Gm-Message-State: APuU4Z/tsF7vv1NiUKRsOci9hToNj6Z5bghVTkshxMY71NjUEKa8RGPj
	DF4KytonI/3x0VBq1pYUBJlsIsbq/PnAFzLrK7BPi+LVZvhEwPwryd3dITkoZAZwqf18OMx67PA
	aldQvVsWAg1IwlYp0lT4vHX01cOgOzJzU55TzSA9qKVTLmIUhHwJA+9W2Pxa1UPC4hXy0PTyiN9
	AcwDAebdn+9W60zjKMEI8fcN7r0uAF3FCjwmDiWgLSlXyy
X-Gm-Gg: AZFdTZfr4vn/2I4MsuzW06IhlLZHT+YJt5RqrFmB5twHWXO8c0q9WYLgBbPRgRs403z
	O1ENXfaJ7MdfhkJ6L+pobWEtsxW3F3BgiQU2PvWgXXJIX0mmWvRGF4gbi9sY9M780aOx3QSR2sd
	KGILzyYnqbGg+hkSwYV98JHvLSjS+8dmMTBv1hb39/eHN4lhibw28D8opw57pEquLjUCh69Gn/9
	6U7gEWTavKO7FdEdg2Mz8GHpCkN1jkWWc/9e2zTLFWf78vv6K1oZiyocqfL235+Gu4JSITlwYU=
X-Received: by 2002:a05:620a:2803:b0:943:f4a1:7bb9 with SMTP id af79cd13be357-949ba9555b7mr2616941085a.18.1795603712204;
        Wed, 25 Nov 2026 02:48:32 -0800 (PST)
X-Received: by 2002:a05:620a:2803:b0:943:f4a1:7bb9 with SMTP id
 af79cd13be357-949ba9555b7mr2616938185a.18.1795603711712; Wed, 25 Nov 2026
 02:48:31 -0800 (PST)
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261120-recovery-v4-v4-0-53d6a04490e0@oss.qualcomm.com> <20261120-recovery-v4-v4-8-53d6a04490e0@oss.qualcomm.com>
In-Reply-To: <20261120-recovery-v4-v4-8-53d6a04490e0@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 11:48:20 +0100
X-Gm-Features: Aa3M54odefbRxi0PaiCQAzNWQ-0JR92gAABK5WdL3_Jpsmn2PFUYlb6w5-3lwyY
Message-ID: <CAFEp6-0ONdrwu4ofxz40AHJ=GRhFRedT3AbZvaum2M8FUi1cPQ@mail.gmail.com>
Subject: Re: [PATCH ath-next v4 08/10] wifi: ath10k: trigger recovery on
 corrupted HTC bundle lookahead
To: Kang Yang <kang.yang@oss.qualcomm.com>
Cc: Jeff Johnson <jjohnson@kernel.org>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: llXIgQG3N22Qryi1JINQyWZDjQowuHjj
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA0MiBTYWx0ZWRfXwnXcRX5nssmt
 V8Rs+l8Kw7Ig6I10RGKRieWymZg+UXF8rCafbMEOnnG67eRcSCcO3nYmjYFhpNx5qjMWK1a/RNs
 WmzhtX8/h0W5rNnMU4HaypynUPRUOTk=
X-Proofpoint-GUID: llXIgQG3N22Qryi1JINQyWZDjQowuHjj
X-Authority-Analysis: v=2.4 cv=CKu/zhrD c=1 sm=1 tr=0 ts=6b06bd00 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8 a=8v4nwiihW6ynDyRW_tkA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA0MiBTYWx0ZWRfXz/NosCcR0Irh
 K1MORQtjrS1PGE6uIzaufkk4dfqktq/BJTKdE4K/vqIN2tjWGFbMU4N3r+ZBfPdHFdhOFSsoj9Z
 lNiGOKNEibGl+nM7AbDS1DI28+FZuuJyxqc7RsFRMnP/0v/CBLiCHF3CpqrYEzJlPdm7XyY85hD
 0C14BB0JZwVPWk8z5s+NmqNIX1wLFDanXJZBZNG97WkGOFkk4LtZGq0+DkhCpC3wZ8Lu5a7ZKFu
 tjpNi6UwFMom6H5semr+fvMp0O436vBH86j9Gs34oHvrL9WODQ6gbcqiddG4rNU8u1be0c58XFo
 WFqKLJ23Syx8tqTtvrX9e6P1MUOVPdmW6Rit09L10B4eSx+I/4HDBYtdfDtp7lnmkK9mxBj+Shk
 DkiGteLrsQko8Vi+N6sNSXGnAZZDsEuOdmsQVnvEWoA0YAgR3MKh48nZh13pcmADPwFyaNmYoy8
 utVrTPL2/JGRvqLPKQQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250042

On Fri, Nov 20, 2026 at 9:43=E2=80=AFAM Kang Yang <kang.yang@oss.qualcomm.c=
om> wrote:
>
> When firmware crashes, the SDIO interrupt handler may read a
> corrupted RX lookahead whose header reports more messages than
> ar->htc.max_msgs_per_htc_bundle. The driver then prints errors such
> as:
>
>   HTC bundle length 2322 exceeds maximum 32
>   failed to allocate a bundle: -12
>   failed to get pending recv messages: -12
>   failed to process pending SDIO interrupts: -12
>
> The handler returns -ENOMEM without consuming the mailbox lookahead
> or checking the firmware-crash CPU interrupt. The SDIO interrupt
> therefore remains asserted and ath10k_sdio_irq_handler() repeatedly
> processes the same invalid lookahead.
>
> Stress-test logs show that this interrupt storm can continue for
> 15 to 20 seconds before the firmware watchdog allows the crash
> interrupt to be observed and recovery to start. RX remains stalled
> and user traffic times out during this interval.
>
> ath10k_sdio_mbox_rx_alloc() already triggers recovery when the
> lookahead payload length exceeds ATH10K_HTC_MBOX_MAX_PAYLOAD_LENGTH.
> A bundle count above max_msgs_per_htc_bundle is the same class of
> corrupted lookahead.
>
> Start recovery as soon as the invalid bundle count is detected so the
> HIF is reinitialized instead of waiting for the firmware watchdog.
> ath10k_core_start_recovery() does nothing when a recovery is already
> pending, which would leave the interrupt storm running, so also mask
> the target interrupts.
>
> Tested-on: QCA6174 hw3.2 PCI WLAN.RM.4.4.1-00288-QCARMSWPZ-1
> Tested-on: QCA6174 hw3.2 SDIO WLAN.RMH.4.4.1-00189
>
> Signed-off-by: Kang Yang <kang.yang@oss.qualcomm.com>
> ---
>  drivers/net/wireless/ath/ath10k/sdio.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/drivers/net/wireless/ath/ath10k/sdio.c b/drivers/net/wireles=
s/ath/ath10k/sdio.c
> index 748ba6749339..fdf19ce4b55b 100644
> --- a/drivers/net/wireless/ath/ath10k/sdio.c
> +++ b/drivers/net/wireless/ath/ath10k/sdio.c
> @@ -497,6 +497,8 @@ static int ath10k_sdio_mbox_rx_process_packets(struct=
 ath10k *ar,
>         return ret;
>  }
>
> +static int ath10k_sdio_disable_intrs(struct ath10k *ar);
> +
>  static int ath10k_sdio_mbox_alloc_bundle(struct ath10k *ar,
>                                          struct ath10k_sdio_rx_data *rx_p=
kts,
>                                          struct ath10k_htc_hdr *htc_hdr,
> @@ -513,6 +515,11 @@ static int ath10k_sdio_mbox_alloc_bundle(struct ath1=
0k *ar,
>                             "HTC bundle length %u exceeds maximum %u\n",
>                             le16_to_cpu(htc_hdr->len),
>                             max_msgs);
> +               ath10k_core_start_recovery(ar);
> +               /* Recovery is a no-op if already pending, so also mask t=
he
> +                * target interrupts to stop the IRQ storm.
> +                */

Drop the generated/verbose comment above or simply say: "Prevent IRQ storm.=
"

> +               ath10k_sdio_disable_intrs(ar);
>                 return -ENOMEM;
>         }
>
>
> --
> 2.34.1
>
