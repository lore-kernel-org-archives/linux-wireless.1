Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795275700;
	b=uokuCmE4QxDtSjav1vhoF6vXaJh8qJiNIMdXP6hz1wimkaSejsXjVioKuQGFnBTmR/Qp
	 8kP+oHsNjO/Mi6452KA1pzVnrvEtvS0/iy1nA+b2mJvUrSozdGbL3ilDYo2yb6MWS4e2f
	 ua4WGqESvWp2Q9f1EWCLbFkf7yW3amZRgz3PyjwWd4Am+cPTREO0d+ep37rcWX/n/OwXA
	 GGc//FS9D+3p5reYkbPoF3pS0xGeTNvHfD/c6njCqAu4xj6lRLQc0xFGzyr/Q5gBXW+rf
	 UswPaqwHnvMxHFLw8MakbRtVOCLbhzfrnzfz1OC4p4PHibZf3KWCRhzI+Dzn0SrR9/w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795275700;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=MnEv+0GadTuzB43O4JsnCW8IHtMKb4P4i06v056VF9Q=;
	b=X4igE2eLN37f7iktUecTqv+ydl9EvOAKpwNwWzw2Vl4ucANXiH91mfyWaFoSYcQuBVAS
	 WGIkwgzJJfFUGllWiFJ4VBG/0GpQwK6cqGD5ynD9X7+i1JyUt2AyPyYBGjq23KaFNDHPb
	 wWVWXj8XUDCsNDJlf493IvsiaiUvnUPQ09z6TeexyhO66cxPAEeUe6HXxivOGnhZ6spC8
	 cKWBIV6Gg8E4cyuJJN2wNEnjo6/aYpaIIoo+renQxXgIaWkZomgYl3YBVo3a/gwP6O0mk
	 s1uRtu4Xd9eE8+lRcw/O0I1D2GTz84hYZMlFU3KvrTG+dBA2HhZLDckEN0R/1NGJd8Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Zf00+kHY;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ucd7nsp3;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB1D0606A32A
	for <linux-wireless@vger.kernel.org>; Sat, 21 Nov 2026 15:41:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB1D0606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Zf00+kHY;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ucd7nsp3
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ALFbT1f004037
	for <linux-wireless@vger.kernel.org>; Sat, 21 Nov 2026 15:41:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MnEv+0GadTuzB43O4JsnCW8IHtMKb4P4i06v056VF9Q=; b=Zf00+kHYG0nXv34R
	uTOrosKKQBy6BVaqL1IvPXEI/Uf+CQnI1Ajk6ucZ3ELCIllSNbsgbycGIvtsEzcX
	wCDl1fbGNDf6YLEynk4b9VFFbxsij6jAR9c1tRc+p1gjL4bcU84QgEbnZ3oPL2r2
	tFa6UWHiltGB66Tzk0FSIbu8XN9MSruR/BeP3HGUMFtxgM0RAcZsX8etsEOdlD7h
	j86zbS1agFGHdPfk+uCecXjR8h7CY2JZ4fHq1C1Jbz8TLeTsoh3KhYGAK8br1FKm
	+cJ5iFNaVSzsLYgS3FJY0g21QFKhAj0CKgxp0334cGKnH8sR92kLFrhT8SBSaq1U
	yv2XmQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j34ka18wh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Sat, 21 Nov 2026 15:41:39 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9495c71055bso395346085a.2
        for <linux-wireless@vger.kernel.org>; Sat, 21 Nov 2026 07:41:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795275698; cv=none;
        d=google.com; s=arc-20260327;
        b=JEMRVves06YCYl5Dm3GF84vjLF6K4a/xim9/ehrKMnj3oQkFt9hOVOMCBtaX0uXPZ9
         1zpc+22LO15kDipuU6GJltYwIZgErWkko+TGmr8akl+y8ZOpiEK/+Bn9WssOzeMjxulN
         JFzrgxdBsoLGzaBq0vKtbMXbkQ6llHcO4T1CfhE60fI0XOjsrX2bQou9d6N2KFrK8ISU
         Sp6GwnLuZ3Jg7wSDXMYO7bjcYRYgWsqTMOlO7jUCc2IDiG2HCUvy13R32LdK9P/FMjjU
         o/QJtu+R8oU8ec8/xUT1HgMrlqJFOAvHm8j2kLRC+tQG6U4Z2ocazhTp8XVcF0o6aG+i
         1kpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MnEv+0GadTuzB43O4JsnCW8IHtMKb4P4i06v056VF9Q=;
        fh=nBdr1Jf0ZeSq1eRdUGEbhBIGreMMzFC4vVpQIX7Rk7w=;
        b=SWt0ii58eUne1KH6LIITo3m43VNPGeeIuhOhxpIf/SVAtizVOJMgE1i1mFQzNSnPOt
         IyU4kNu48PC6cfr/qm0aNxZNNOfeJL1JyYuuW7S4l9f0jELFrKlvk1LfHHDOg9aPYw8b
         +eqY8EvLu2PC/rIijFfdgZA9iCQy+8ch076LZ+XfMqh59eGnMQ/GT1cRKycp+rK+X91M
         YJmEHyoB3+LtZ2c8ajI7LGCEw1bTRPNlVg08/sEFgH9LGD5fAxeU5TfuLG9EEo8ydAhF
         LPq9qP1Cki3IGL9tWCYTOmazmBWrmjXl0XheisIaMvXqnE+RSQTD11WyILB0nSWSeQR+
         SJRA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795275698; x=1795880498; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MnEv+0GadTuzB43O4JsnCW8IHtMKb4P4i06v056VF9Q=;
        b=Ucd7nsp33L7gDJ6HgiI6zluf6pdT4SRd3Afb1wLoUetypMawHW7fscP4p2PYWca1ss
         11zkLJgK0/uJk+wzsX9EtS438QIaO/asRZy3qttOJsYvG+T/S0CnlSDL3Qo4Lc01/JkM
         OePgBGf8SA08I0DzB7hNnQWJyrRe9/b1TAoF7zhmzWCzZOo/3x0pCAZdBnedOQgsWiGV
         kXgEJ0+eHazMpahOmuxm8JFu57ieKkYhvt3aJYYpIbWwOxG+xyhgSrbLhrtcw5Wd1IcQ
         pyJc0xa10KUyWIad9cI6Db5gO7vGYqYs3PaMMeMd9Jb2xTj+kzVEoFP9w5L3z0H6RK85
         kdEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795275698; x=1795880498;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MnEv+0GadTuzB43O4JsnCW8IHtMKb4P4i06v056VF9Q=;
        b=mAv/1GFPhTceeXVv6bMwzslDduLNMyBewZdvfv7b3b2tLxVzQmGbwIDwb9jLDYGpLr
         g8GBLcWJYNMijc3Iil6KvEqCYLYoSSOOOmKH4CFkzkVT0n69GxCWreKdaTN0paknMHNG
         gEVhlJPE4F0krxqknpwgZEPQQbhOmLMG4OC4YtkJSSe5TfI1YWjVlANzhMhEl2TVd83T
         L2HR9Dncvuk/xi0jMwief4Ym2fvr9d75nnWXk54QeSRdKpaQNr+tJj5Bms17luQrJTyb
         RUo/Kbpc76P5cDunU1jUUvFIoV+qW5ezCky7YrTvgLg3Fwynud+HEtmspD3pY/2uFB9B
         0ZPg==
X-Forwarded-Encrypted: i=1; AL+hErH4YsWdnKvTjVzAueO8LCZUvwIp1VAr4cYZTQ+AAOOYQPRbdbZnv2/ALSZ5iwtfdnx/dUf9m6x9vlH63+AT1w==@vger.kernel.org
X-Gm-Message-State: APuU4Z8XNuoXtOgkQCeYXcI9V3Mhr3/sZng3I5mYeKPHgE4UXLCN9iRL
	iDQkdNJeqfEEjiaohxi4O37dhWBDR0jXYmoJsv1bSU/7A0Xlp9HnaLw9hb7VqsFFxqbHOgskYX5
	K0s+S0sHseqNXMH0gI282Pm/EyFXXhLudaOMAuje0XLGFtXhC561G4wUPmMYl2mC0d6wDuzIf7E
	DrMGsOe53/qyuPfUE9y9RSMIwa2SS7sMF8jFdrmOsvzXEm51TIIZLkBWYpRR2l
X-Gm-Gg: AZFdTZfICkzjJ138bfe/l+kEtk8xkgO9GTBgMfeNSNy5ymhE3SvtqBRlLtkITNsBw43
	DfN6fjZXKCqB1M9G0/dDfNdmapnMwHHDaKtfggWUEKvmR7ZQnbmJZfAbEe7hH55JPnnemixp2A4
	CQ3sFPokrgQuzjCPl54tk3a/QDZaiiS6ShbZLQJ17P4xtxbsU+P1EvgiTcNBs39vavbaoY0goSy
	sw3IRHycHk3K97NtO13cqwZwP7H3zVkDBVteJQxDBdY2TgLVvQoSrsC5PnJK7qrmWPvLjzgU1o=
X-Received: by 2002:a05:620a:450e:b0:949:6fb1:b422 with SMTP id af79cd13be357-949ba9b7194mr1114809185a.16.1795275697854;
        Sat, 21 Nov 2026 07:41:37 -0800 (PST)
X-Received: by 2002:a05:620a:450e:b0:949:6fb1:b422 with SMTP id
 af79cd13be357-949ba9b7194mr1114805185a.16.1795275697365; Sat, 21 Nov 2026
 07:41:37 -0800 (PST)
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261120202652.344435-1-mick@yoxcu.de> <20261120202652.344435-2-mick@yoxcu.de>
In-Reply-To: <20261120202652.344435-2-mick@yoxcu.de>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Sat, 21 Nov 2026 16:41:25 +0100
X-Gm-Features: Aa3M54pCyq3c11vW8Cv8YJB0fq3KEU2hM8dxCkOG_3zQ7oEIL2UMWXIcnugLorw
Message-ID: <CAFEp6-39PaCm5JoFVwpYQEuM7Eg0xDKwWKnripuDwh8fVXS24A@mail.gmail.com>
Subject: Re: [PATCH 1/2] wifi: ath10k: configure the WoW action frame wakeup filter
To: Michael Auer <mick@yoxcu.de>
Cc: Jeff Johnson <jjohnson@kernel.org>, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIxMDA2MiBTYWx0ZWRfXyGBODCn827MP
 AF22JJ01sKcAZZUV/AmjKm1clFBqjlX+0QBFucXpiRy38/egUQHOT/ONmZbHP7VG3Vev0BWa6Dj
 UvNSZDxh7cVkQqZycnYKwvz7bn6IOX+4m6Rga+0TLyB4jccZ7dKw8JERBXZGust5zDDr20OW+Dm
 +7UwsO9NMVLjY4Q76N8yjmhW0cXP9EgfkAnqllm7fr4EG2JUuJGOLdHqoopTtfpjJ9k04eiV3T2
 ULuXu9Hf6igBIBGxX8exuSPbvwAkq6wWMxnZNIoLxFdnfH0aM9E24C67H/ganCEOrGqiWqJRmjG
 66jhWFRgVfPdS/aZctru5AnJIWshfEew3sC1a+ajTQv11HnBWTPDGzwQJ1g3YMY+zqY2OVSLQ7D
 yslkyUM/fZ4eC9pLJaJ5So2Is2bnHasnwwhEGhcVuxCpmb/xlp7PmZwV2sLEnBdR2BuC6eEQNZY
 YOZTQZyaqsmPdLMO+Gw==
X-Authority-Analysis: v=2.4 cv=RJEmjIi+ c=1 sm=1 tr=0 ts=6b01bbb3 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=K619b0bAtYckEcRTAzsA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: O61sW7tPt9YmQTXk4heL6r6tLZd3F9ud
X-Proofpoint-ORIG-GUID: O61sW7tPt9YmQTXk4heL6r6tLZd3F9ud
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIxMDA2MiBTYWx0ZWRfX1mWz5QrBJeDz
 ya59hZrsQpxPbFp1koUiR2K+QP0f/5ETBDnrxqpAavUF0UQvPk8ZM4pszMM58fOZ9XtNOGd+DLA
 Lv5GMJUUOXNNfdH4gYiMLvcz7BqALw0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-21_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 impostorscore=0 spamscore=0 suspectscore=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611210062

Hi Michael,

On Fri, Nov 20, 2026 at 9:27=E2=80=AFPM Michael Auer <mick@yoxcu.de> wrote:
>
> On WCN3990 almost every system suspend with WoWLAN enabled ends within
> a second. The firmware wakes the host with wake reason 38, which is
> WOW_REASON_ACTION_FRAME_RECV in Qualcomm's fw-api. ath10k's wake reason
> enum stops at 27, so the debug log shows "wow wakeup host reason (null)".
>
> Qualcomm's own host drivers (qcacld-2.0 and qcacld-3.0) send
> WMI_WOW_SET_ACTION_WAKE_UP_CMDID, which sets the action frame
> categories that may wake the host. ath10k never sends it, so the
> firmware default applies.
>
> Send it for station vdevs in ath10k_vif_wow_set_wakeups() with the
> values of qcacld-3.0: allow spectrum management, QoS, public, SA query,
> protected dual of public, WNM, WME, FST and VHT action frames, and
> ignore spectrum management Measurement and TPC Requests. A failure is
> logged and does not abort the suspend.
>
> Also add wake reasons 28 to 38 and print the reason number, so unknown
> reasons are visible.
>
> On a OnePlus 6, 3 of 3 WoW suspends were woken within 1 s with reason
> 38 before this change. With it, suspends last until a real wakeup
> (magic packet, pattern match or RTC). In a one hour idle test with a
> push connection the phone was suspended 87.6 % of the time.
>
> Tested-on: WCN3990 hw1.0 SNOC WLAN.HL.2.0.c8-00050-QCAHLSWMTPLZ-1
>
> Signed-off-by: Michael Auer <mick@yoxcu.de>
> ---
> The per-category array has 32 words, like the 2018 qcacld-3.0 for
> sdm845. qcacld-2.0 and newer qcacld-3.0 send 256. The fw-api defines
> it as a variable length array, and all allowed categories are below
> 32. I only tested 32.
>
>  drivers/net/wireless/ath/ath10k/wmi-ops.h | 19 +++++++++
>  drivers/net/wireless/ath/ath10k/wmi-tlv.c | 47 +++++++++++++++++++++++
>  drivers/net/wireless/ath/ath10k/wmi-tlv.h | 32 +++++++++++++++
>  drivers/net/wireless/ath/ath10k/wmi.c     |  4 +-
>  drivers/net/wireless/ath/ath10k/wmi.h     | 23 +++++++++++
>  drivers/net/wireless/ath/ath10k/wow.c     | 10 +++++
>  6 files changed, 133 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/net/wireless/ath/ath10k/wmi-ops.h b/drivers/net/wire=
less/ath/ath10k/wmi-ops.h
> index f3f6b5954b27..780c2947cc5f 100644
> --- a/drivers/net/wireless/ath/ath10k/wmi-ops.h
> +++ b/drivers/net/wireless/ath/ath10k/wmi-ops.h
> @@ -179,6 +179,8 @@ struct wmi_ops {
>                                                     enum wmi_wow_wakeup_e=
vent event,
>                                                     u32 enable);
>         struct sk_buff *(*gen_wow_host_wakeup_ind)(struct ath10k *ar);
> +       struct sk_buff *(*gen_wow_set_action_wake_up)(struct ath10k *ar,
> +                                                     u32 vdev_id);
>         struct sk_buff *(*gen_wow_add_pattern)(struct ath10k *ar, u32 vde=
v_id,
>                                                u32 pattern_id,
>                                                const u8 *pattern,
> @@ -1422,6 +1424,23 @@ ath10k_wmi_wow_host_wakeup_ind(struct ath10k *ar)
>         return ath10k_wmi_cmd_send(ar, skb, cmd_id);
>  }
>
> +static inline int
> +ath10k_wmi_wow_set_action_wake_up(struct ath10k *ar, u32 vdev_id)
> +{
> +       struct sk_buff *skb;
> +       u32 cmd_id;
> +
> +       if (!ar->wmi.ops->gen_wow_set_action_wake_up)
> +               return -EOPNOTSUPP;
> +
> +       skb =3D ar->wmi.ops->gen_wow_set_action_wake_up(ar, vdev_id);
> +       if (IS_ERR(skb))
> +               return PTR_ERR(skb);
> +
> +       cmd_id =3D ar->wmi.cmd->wow_set_action_wake_up_cmdid;
> +       return ath10k_wmi_cmd_send(ar, skb, cmd_id);
> +}
> +
>  static inline int
>  ath10k_wmi_wow_add_pattern(struct ath10k *ar, u32 vdev_id, u32 pattern_i=
d,
>                            const u8 *pattern, const u8 *mask,
> diff --git a/drivers/net/wireless/ath/ath10k/wmi-tlv.c b/drivers/net/wire=
less/ath/ath10k/wmi-tlv.c
> index 01f2d1fa9d7d..2a3b2bc2a478 100644
> --- a/drivers/net/wireless/ath/ath10k/wmi-tlv.c
> +++ b/drivers/net/wireless/ath/ath10k/wmi-tlv.c
> @@ -3713,6 +3713,51 @@ ath10k_wmi_tlv_op_gen_wow_add_wakeup_event(struct =
ath10k *ar,
>         return skb;
>  }
>
> +static struct sk_buff *
> +ath10k_wmi_tlv_op_gen_wow_set_action_wake_up(struct ath10k *ar, u32 vdev=
_id)
> +{
> +       struct wmi_tlv_wow_set_action_wake_up_cmd *cmd;
> +       struct wmi_tlv *tlv;
> +       struct sk_buff *skb;
> +       __le32 *bitmaps;
> +       void *ptr;
> +       size_t len;
> +
> +       len =3D sizeof(*tlv) + sizeof(*cmd) +
> +             sizeof(*tlv) +
> +             WMI_TLV_WOW_ACTION_WAKE_UP_NUM_CATEGORIES * sizeof(__le32);
> +       skb =3D ath10k_wmi_alloc_skb(ar, len);
> +       if (!skb)
> +               return ERR_PTR(-ENOMEM);
> +
> +       ptr =3D (void *)skb->data;
> +       tlv =3D ptr;
> +       tlv->tag =3D __cpu_to_le16(WMI_TLV_TAG_STRUCT_WOW_SET_ACTION_WAKE=
_UP_CMD);
> +       tlv->len =3D __cpu_to_le16(sizeof(*cmd));
> +       cmd =3D (void *)tlv->value;
> +
> +       cmd->vdev_id =3D __cpu_to_le32(vdev_id);
> +       cmd->operation =3D __cpu_to_le32(WMI_TLV_WOW_ACTION_WAKE_UP_OP_SE=
T);
> +       cmd->action_category_map[0] =3D
> +               __cpu_to_le32(WMI_TLV_WOW_ACTION_WAKE_UP_CATEGORY_MAP0);
> +
> +       ptr +=3D sizeof(*tlv);
> +       ptr +=3D sizeof(*cmd);
> +
> +       tlv =3D ptr;
> +       tlv->tag =3D __cpu_to_le16(WMI_TLV_TAG_ARRAY_UINT32);
> +       tlv->len =3D __cpu_to_le16(WMI_TLV_WOW_ACTION_WAKE_UP_NUM_CATEGOR=
IES *
> +                                sizeof(__le32));
> +       bitmaps =3D (void *)tlv->value;
> +       bitmaps[WLAN_CATEGORY_SPECTRUM_MGMT] =3D
> +               __cpu_to_le32(WMI_TLV_WOW_ACTION_WAKE_UP_SPECTRUM_MGMT_IG=
NORE);
> +
> +       ath10k_dbg(ar, ATH10K_DBG_WMI,
> +                  "wmi tlv wow set action wake up vdev_id %d category ma=
p 0x%08x\n",
> +                  vdev_id, WMI_TLV_WOW_ACTION_WAKE_UP_CATEGORY_MAP0);
> +       return skb;
> +}
> +
>  static struct sk_buff *
>  ath10k_wmi_tlv_gen_wow_host_wakeup_ind(struct ath10k *ar)
>  {
> @@ -4272,6 +4317,7 @@ static struct wmi_cmd_map wmi_tlv_cmd_map =3D {
>         .wow_enable_cmdid =3D WMI_TLV_WOW_ENABLE_CMDID,
>         .wow_hostwakeup_from_sleep_cmdid =3D
>                                 WMI_TLV_WOW_HOSTWAKEUP_FROM_SLEEP_CMDID,
> +       .wow_set_action_wake_up_cmdid =3D WMI_TLV_WOW_SET_ACTION_WAKE_UP_=
CMDID,
>         .rtt_measreq_cmdid =3D WMI_TLV_RTT_MEASREQ_CMDID,
>         .rtt_tsf_cmdid =3D WMI_TLV_RTT_TSF_CMDID,
>         .vdev_spectral_scan_configure_cmdid =3D WMI_TLV_SPECTRAL_SCAN_CON=
F_CMDID,
> @@ -4604,6 +4650,7 @@ static const struct wmi_ops wmi_tlv_ops =3D {
>         .gen_wow_enable =3D ath10k_wmi_tlv_op_gen_wow_enable,
>         .gen_wow_add_wakeup_event =3D ath10k_wmi_tlv_op_gen_wow_add_wakeu=
p_event,
>         .gen_wow_host_wakeup_ind =3D ath10k_wmi_tlv_gen_wow_host_wakeup_i=
nd,
> +       .gen_wow_set_action_wake_up =3D ath10k_wmi_tlv_op_gen_wow_set_act=
ion_wake_up,
>         .gen_wow_add_pattern =3D ath10k_wmi_tlv_op_gen_wow_add_pattern,
>         .gen_wow_del_pattern =3D ath10k_wmi_tlv_op_gen_wow_del_pattern,
>         .gen_wow_config_pno =3D ath10k_wmi_tlv_op_gen_config_pno,
> diff --git a/drivers/net/wireless/ath/ath10k/wmi-tlv.h b/drivers/net/wire=
less/ath/ath10k/wmi-tlv.h
> index ea18ed8939db..2af7c9df4260 100644
> --- a/drivers/net/wireless/ath/ath10k/wmi-tlv.h
> +++ b/drivers/net/wireless/ath/ath10k/wmi-tlv.h
> @@ -189,6 +189,10 @@ enum wmi_tlv_cmd_id {
>         WMI_TLV_EXTWOW_ENABLE_CMDID,
>         WMI_TLV_EXTWOW_SET_APP_TYPE1_PARAMS_CMDID,
>         WMI_TLV_EXTWOW_SET_APP_TYPE2_PARAMS_CMDID,
> +       WMI_TLV_WOW_ENABLE_ICMPV6_NA_FLT_CMDID,
> +       WMI_TLV_WOW_UDP_SVC_OFLD_CMDID,
> +       WMI_TLV_WOW_HOSTWAKEUP_GPIO_PIN_PATTERN_CONFIG_CMDID,
> +       WMI_TLV_WOW_SET_ACTION_WAKE_UP_CMDID,
>         WMI_TLV_RTT_MEASREQ_CMDID =3D WMI_TLV_CMD(WMI_TLV_GRP_RTT),
>         WMI_TLV_RTT_TSF_CMDID,
>         WMI_TLV_SPECTRAL_SCAN_CONF_CMDID =3D WMI_TLV_CMD(WMI_TLV_GRP_SPEC=
TRAL),
> @@ -2202,6 +2206,34 @@ struct wmi_tlv_wow_add_del_event_cmd {
>         __le32 event_bitmap;
>  } __packed;
>
> +/* Action frame categories that may wake the host from WoW, as in
> + * qcacld-3.0: spectrum management (0), QoS (1), public (4), SA query (8=
),
> + * protected dual of public (9), WNM (10), WME (17), FST (18), VHT (21).
> + */
> +#define WMI_TLV_WOW_ACTION_WAKE_UP_CATEGORY_MAP0       0x00260713

You describe the bitfield above, so please add defines for the categories.

> +
> +/* Per-category bitmaps of action codes to ignore (1 =3D ignore). Like
> + * qcacld-3.0, ignore Measurement Request (0) and TPC Request (2).
> + */
> +#define WMI_TLV_WOW_ACTION_WAKE_UP_NUM_CATEGORIES      32
> +#define WMI_TLV_WOW_ACTION_WAKE_UP_SPECTRUM_MGMT_IGNORE        (BIT(0) |=
 BIT(2))

Same as above.

> +
> +enum wmi_tlv_wow_action_wake_up_op {
> +       WMI_TLV_WOW_ACTION_WAKE_UP_OP_RESET =3D 0,
> +       WMI_TLV_WOW_ACTION_WAKE_UP_OP_SET =3D 1,
> +       WMI_TLV_WOW_ACTION_WAKE_UP_OP_ADD_SET =3D 2,
> +       WMI_TLV_WOW_ACTION_WAKE_UP_OP_DELETE_SET =3D 3,
> +};
> +
> +/* WMI_WOW_SET_ACTION_WAKE_UP_CMD_fixed_param, followed by a
> + * WMI_TLV_TAG_ARRAY_UINT32 of per-category action code bitmaps.
> + */
> +struct wmi_tlv_wow_set_action_wake_up_cmd {
> +       __le32 vdev_id;
> +       __le32 operation;
> +       __le32 action_category_map[8];
> +} __packed;
> +
>  struct wmi_tlv_request_peer_stats_info {
>         __le32 request_type;
>         __le32 vdev_id;
> diff --git a/drivers/net/wireless/ath/ath10k/wmi.c b/drivers/net/wireless=
/ath/ath10k/wmi.c
> index e57588c19c80..eca6bb189577 100644
> --- a/drivers/net/wireless/ath/ath10k/wmi.c
> +++ b/drivers/net/wireless/ath/ath10k/wmi.c
> @@ -4673,8 +4673,8 @@ void ath10k_wmi_event_wow_wakeup_host(struct ath10k=
 *ar, struct sk_buff *skb)
>                 return;
>         }
>
> -       ath10k_dbg(ar, ATH10K_DBG_WMI, "wow wakeup host reason %s\n",
> -                  wow_reason(ev.wake_reason));
> +       ath10k_dbg(ar, ATH10K_DBG_WMI, "wow wakeup host reason %d %s\n",
> +                  ev.wake_reason, wow_reason(ev.wake_reason));
>  }
>
>  void ath10k_wmi_event_dcs_interference(struct ath10k *ar, struct sk_buff=
 *skb)
> diff --git a/drivers/net/wireless/ath/ath10k/wmi.h b/drivers/net/wireless=
/ath/ath10k/wmi.h
> index 7f50a1de6b97..f1a560fb3447 100644
> --- a/drivers/net/wireless/ath/ath10k/wmi.h
> +++ b/drivers/net/wireless/ath/ath10k/wmi.h
> @@ -944,6 +944,7 @@ struct wmi_cmd_map {
>         u32 wow_enable_disable_wake_event_cmdid;
>         u32 wow_enable_cmdid;
>         u32 wow_hostwakeup_from_sleep_cmdid;
> +       u32 wow_set_action_wake_up_cmdid;
>         u32 rtt_measreq_cmdid;
>         u32 rtt_tsf_cmdid;
>         u32 vdev_spectral_scan_configure_cmdid;
> @@ -7060,6 +7061,17 @@ enum wmi_wow_wake_reason {
>         WOW_REASON_DFS_PHYERR_RADADR_EVENT,
>         WOW_REASON_BEACON_RECV,
>         WOW_REASON_CLIENT_KICKOUT_EVENT,
> +       WOW_REASON_NAN_EVENT,
> +       WOW_REASON_EXTSCAN,
> +       WOW_REASON_RSSI_BREACH_EVENT,
> +       WOW_REASON_IOAC_REV_KA_FAIL_EVENT,
> +       WOW_REASON_IOAC_SOCK_EVENT,
> +       WOW_REASON_NLO_SCAN_COMPLETE,
> +       WOW_REASON_PACKET_FILTER_MATCH,
> +       WOW_REASON_ASSOC_RES_RECV,
> +       WOW_REASON_REASSOC_REQ_RECV,
> +       WOW_REASON_REASSOC_RES_RECV,
> +       WOW_REASON_ACTION_FRAME_RECV,

I think addition of the new reason and above debug message change
should be split in another patch/commit.

>         WOW_REASON_DEBUG_TEST =3D 0xFF,
>  };
>
> @@ -7095,6 +7107,17 @@ static inline const char *wow_reason(enum wmi_wow_=
wake_reason reason)
>         C2S(WOW_REASON_DFS_PHYERR_RADADR_EVENT);
>         C2S(WOW_REASON_BEACON_RECV);
>         C2S(WOW_REASON_CLIENT_KICKOUT_EVENT);
> +       C2S(WOW_REASON_NAN_EVENT);
> +       C2S(WOW_REASON_EXTSCAN);
> +       C2S(WOW_REASON_RSSI_BREACH_EVENT);
> +       C2S(WOW_REASON_IOAC_REV_KA_FAIL_EVENT);
> +       C2S(WOW_REASON_IOAC_SOCK_EVENT);
> +       C2S(WOW_REASON_NLO_SCAN_COMPLETE);
> +       C2S(WOW_REASON_PACKET_FILTER_MATCH);
> +       C2S(WOW_REASON_ASSOC_RES_RECV);
> +       C2S(WOW_REASON_REASSOC_REQ_RECV);
> +       C2S(WOW_REASON_REASSOC_RES_RECV);
> +       C2S(WOW_REASON_ACTION_FRAME_RECV);
>         C2S(WOW_REASON_DEBUG_TEST);
>         default:
>                 return NULL;
> diff --git a/drivers/net/wireless/ath/ath10k/wow.c b/drivers/net/wireless=
/ath/ath10k/wow.c
> index 92af8bc63362..5fc68e6cdeb6 100644
> --- a/drivers/net/wireless/ath/ath10k/wow.c
> +++ b/drivers/net/wireless/ath/ath10k/wow.c
> @@ -380,6 +380,16 @@ static int ath10k_vif_wow_set_wakeups(struct ath10k_=
vif *arvif,
>                 }
>         }
>
> +       if (arvif->vdev_type =3D=3D WMI_VDEV_TYPE_STA) {
> +               /* Without this filter WCN3990 wakes the host on action
> +                * frames right after WoW is enabled.
> +                */
> +               ret =3D ath10k_wmi_wow_set_action_wake_up(ar, arvif->vdev=
_id);
> +               if (ret && ret !=3D -EOPNOTSUPP)
> +                       ath10k_warn(ar, "failed to set action frame wakeu=
p filter on vdev %i: %d\n",
> +                                   arvif->vdev_id, ret);
> +       }
> +
>         return 0;
>  }
>
> --
> 2.43.0
>
