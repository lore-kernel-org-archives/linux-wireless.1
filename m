Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794597854;
	b=sttPi1Jr5RaxpIp05YlWU1reY4yKMh1ZFrH2kee6lO0W4CyLJ9BcnXuvZDpm9CQooT0m
	 wRf6FK7zYmb+tPIVwH7Y+P8nSgDI1tRnOebP+n/FHKC97OXVB4ZFHOnpiywjGRpnTU+7E
	 Bm22UMI7nGGieDcksZCpu6WWXtOGPajYPVv/waCaI8I1crMtm8+EahOxjx/ytMamarZR8
	 B5k/aTEaVGTBqeXkILqJODoYz3Pyj74/R/duRk8+5aXHsIgKDqpFizrnnnGv98kffHlW7
	 /LcO+smQsTy3q135aITMubnbYz+8SwK1/mENFgf1YuAX01kOyjZvsH+IkQpnmd+I7Ng==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794597854;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=SEXnzhmVLAcxH1soBXizhJLa12Xqac4KvH+xZwh+kRY=;
	b=JMuIR4SNeus6o0FIl0N7x9RvK7PrVzUyFPeWgbcQ/KnONch/CVUlfOfmB9A9oHytMZ9k
	 L2AlqaLkn5FGrti37n+D7b1nuSC7TGbR48wdHAYE8ksL71ByKjUp/Cyg+2pMCRZRbTYIr
	 hxOsAyAExTYNpfpA3/y+8qAGZBWRp8egQLaqp0aOKAEZybZEqNaF5FMMjds2gVIUnbJAJ
	 2C9z1RBThgYjcNTitEBKBnrDlet1S7kmXXUZ5khA5KMYIlZy14o1oFZPMPp1+J4prahuQ
	 tg9Hk1kADj8iPhvXydAOtrnfj+SLPkrBbryz57L+BQjkO4e0R1CwGpluid6wyDTh/5A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lU+HL2ud;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WwO3irhR;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE68D606A323
	for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 19:24:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EE68D606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lU+HL2ud;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WwO3irhR
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADJ0BQO3850057
	for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 19:24:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SEXnzhmVLAcxH1soBXizhJLa12Xqac4KvH+xZwh+kRY=; b=lU+HL2ud2sEGYsF0
	7farl98IMwxaGqfMUyiVu/PVRu1s4LSLu+Q2ELEreTcnTCHyVLlMysCsXeoRG1Gs
	+wNel4jLMD8DLg/5KjNypLly3yuj25KDwvCQu5xNUyVN54QwGmktGKs5lhycm48z
	7XHojh8XKF3D+dX/KwkccID1CGcKxfur7gPr6TwrP+o2afwXMS/r2SFumcl4dn+Z
	Pg8CpjKtdYijpfZL4xrP8HA8mwavUm5DbxmL5VJj1RAtY3rwiBSIgjjASQBtJmZI
	tJhb2ORHypnZeajpBlMlXq/mLQlw4lJFTUzxHFvyihR5u5c3D2FpXURlArGNSI0q
	hfBkUQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwvu6tthj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 19:24:12 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-33bf1d17dfeso186135eec.2
        for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 11:24:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794597851; cv=none;
        d=google.com; s=arc-20260327;
        b=SWnH80+4Ek/fUge93io2RVKt85zQQXW6/4K/FiZ8arv7AyWnCvNEpyscl0IEHjOp1c
         NkexL7HdaYnVZik3k/o9RqtCdcYyLYrn7gmKo+rHeK4Zv7DfT2htK5R8ibTNTNPkhHwr
         SM/hXkI36QgQRk53BbgwwAoRfKy78Tjf/JLihbyfupKf4YfGkwSC/SGoRD2b2ui2aVm2
         fEGO3vn70un8RXLSNebwuWt0XvBIpaJodc/4L2PJJpnSydJTj9FPlp93nhj7tDg0wpO+
         zHD2U/mxvBImh/8R0XZ2Nxc/o50K5pYKcfDBfZvDr4WC54aFbhAwbtcWEpWSxESpX59l
         lq5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SEXnzhmVLAcxH1soBXizhJLa12Xqac4KvH+xZwh+kRY=;
        fh=ZTGu2KxheIhUluHepOgWjwcGURNiYfA29xyER4Q3lpM=;
        b=AzJERHL47Wfbe5UdQSh5ww70gfr1F5uajPGv5TD0K99SMp8oLSa7JMKmYdn+9wnt0m
         vqjvSiNCzIdtIba2s9XVa/nsI5y9oLFvSTc4SGVMsRh2pFKi6fPJJRinepF2h77TtivA
         E5GCxOT6RB+p3b/wHzB3TbUBpvE+SD/Kw79eFat/8K9nws+fHmSDcuoytlJVpMkhjsDg
         2vmOvz1QhiGc8TOUJmkx95kg+GfiXzdRNoUwmLr4GHraoBTehoPLMV1O0I+DVlqX1Qt1
         GICBv/xpqk16eiN5nvqMejV0Z2/viEJl7RdD3LXoWRpZpVq5HQ/iDrdhWpAGpXhRDUzy
         zTbg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794597851; x=1795202651; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SEXnzhmVLAcxH1soBXizhJLa12Xqac4KvH+xZwh+kRY=;
        b=WwO3irhRRi5b2P7w/th0OAb1zfREf4luqt8bgp01zejlNlQmvxMmmrcAMSlFK04x6t
         SvH1wSRMJxwOAYXMDYi6lV0rDTc8uCvorruxXyh4oWI19lrDZO+tisUe9csbwFz652r9
         wUjo2DU3WQdRJ1oAxER0QZ0DOntwd1MwOIXjwIE8oMPKwOmUtjX9sJ7Aa1jQtBIG/Vx8
         UmRV8iFU/pTuT6bU1oWwzDwnV7Nua6S11U48TTVP+UN9LrVSd8WjZQtZ/mls6ZoOpilE
         nkBKCPUs0wVhb7AMoRVcNmUOZhdJYHMHavgRZWXHQtPQvNNYLqrFm9I0S44bkUPv3X/4
         zqtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794597851; x=1795202651;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SEXnzhmVLAcxH1soBXizhJLa12Xqac4KvH+xZwh+kRY=;
        b=y2lBNChYrPK44vRK9UJ9jNEKpqQ1HEpm4Q/4zbI5K6BnRl0O+5T6t7p1mYgwfyw0HG
         OmkY92WLFa+dhAs7Kinwh/Fm18VqZdraKZjrjP39hmVPEEBZZceiLxm2eWcF2A35346Z
         JDXrlsG2nprhgZXSD4HSeqWNlY5hmCHJRw7tPtePCjnVOjrnV9nbgp51VEkdvKUA+LP+
         YR4Hw4F6Ntkq3ZBEZSkC3jx9/eip6OLHZtctGreqCRrfqlDVqrRoYQbe01+gKWmnm/Oi
         UM2zMTuux59DUKOZjSkub6cjPADXLXfrrHPerpYnVqmRf3LJOY/0E/hqMunSsaCJoDrr
         WsnA==
X-Forwarded-Encrypted: i=1; AL+hErGRIcEnO8uHsPx1CT1qNH6V8R4FbKBSqwSzJjVued1Klwlqk8K2bBNMff6nN7kWuWosK9yAc6Yovc1ITFi3AA==@vger.kernel.org
X-Gm-Message-State: APuU4Z/emELPiJ+u4/trm2r2GTyaWigCGejYMXlnlCv5/WFppQBrqrlo
	JG6fwgSNlXQI2Cn2avBQnjaekyKlgC5zKwdyoZeMgdqGm4JZvbJhMXvtrC8qTc++quPZ0BgDMux
	Xne+TMl7gJTCr5oZ8S2ubtQQc5ck/445p069kzvOK9IiaH0lMqYkNr1rq2P5abQysg/CIdWBTc2
	2JFgLaojawgN4NuMRFMAHZIjuhHOtuIp93t0PYBkKOIeLz
X-Gm-Gg: AYBFou3M+yrDtRkZKjK13jTbrX13v/KmKCYtqfvX5fOF5swLJ4O0Y8C/TMt7G2cW7dm
	LvLBj62l0gGUgopP14CR/qUFnl5YPhbKAIrpEi5nf+UaBg7OcZojbzih6bOuM3alvKB3DdI6RA9
	Sb724U0piZhgRs5MCDL3WqIS7GPAKuSGUaMhsonHHZHZaLNXuyIvbhKFDRSUKZ2Ch6K8Nqe1kLI
	g6CLt1XDPjd3RPsGQ==
X-Received: by 2002:a05:693c:83cf:20b0:376:6ba5:6090 with SMTP id 5a478bee46e88-37964e03109mr5606855eec.1.1794597851421;
        Fri, 13 Nov 2026 11:24:11 -0800 (PST)
X-Received: by 2002:a05:693c:83cf:20b0:376:6ba5:6090 with SMTP id
 5a478bee46e88-37964e03109mr5606809eec.1.1794597850849; Fri, 13 Nov 2026
 11:24:10 -0800 (PST)
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261111215845.814490-1-repaxan@gmail.com>
In-Reply-To: <20261111215845.814490-1-repaxan@gmail.com>
From: Tamizh Raja <tamizh.raja@oss.qualcomm.com>
Date: Sat, 14 Nov 2026 00:53:58 +0530
X-Gm-Features: AclHuK_6dF7HCsH0zkxPTZe8LHnpqOMstzypfJOYUk7ar60_gR3dbF3b-6fTeCQ
Message-ID: <CABkEBKYcabdNgiMNyYEdYPmGUo3z1=p9NtMZC+zRXiZ8gwO4+w@mail.gmail.com>
Subject: Re: [PATCH] wifi: ath12k: set OFFLOAD_ENCAP_4ADDR on interface bringup
To: Ronald Ouyang <repaxan@gmail.com>
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA3NyBTYWx0ZWRfX8lesTdW2S3YU
 r18psi72SJZLhr9aAAp+altXQtX//kaFl+Z5nPLNtY5xkHkOnbR4QvekEAh+gpGsOIPb0GmvBoO
 JXuP8JjG+EdwX4zhiZgYjJAC98SpOPZYRcHQegNe0domo5CNI9yjVFKm6DqhrpQ5LJ39Kgmw/JU
 IGlStStwHJUq8+nWfXLASm4Z43Qa0QQGm5k2j17Cw9zWTQmV+Rde8UcRwQ+dySqb6JVbHnmJ8UP
 qHVZpqxH3dUzrkKbKCMR0JNWsRUGLaXKf/jUXXp8ft7y18YgA3VYqAlKr41oj5EVNwDdzgyR0P+
 XnpM8vLLCJoqmlNvXwrtwRvgw71iH+DywHFNXoVjuKtt597GOZXr/IjxC+JeapzWtcGczUvzBrO
 uZtCiENYQUPJLjXTWrF1C5vIEG0JHNaxOX6x1Nftebk5wvY+9Oo7UEPTr8xoWTwrePaqji4I8tz
 S4tIgNdzJFlPmj9OktQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA3NyBTYWx0ZWRfX8m3Ze4rSmqqP
 zMmFTvfgM7ZmCBt1PU9FRAHoLztDL+UnsXoU40O+MbfnjF0BZRwwy/DRs0ZDsBiU2tuw4r1UpDT
 de5+ZQFIAOJjb7muGy/pr1QGSjJNm7o=
X-Proofpoint-GUID: w4AUJti0o-nhEzoNHXUHFJbmMJQoGFPu
X-Proofpoint-ORIG-GUID: w4AUJti0o-nhEzoNHXUHFJbmMJQoGFPu
X-Authority-Analysis: v=2.4 cv=JfcpPkKV c=1 sm=1 tr=0 ts=6af763dc cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=JfrnYn6hAAAA:8 a=pGLkceISAAAA:8
 a=TztX_nJYAh8Hf7AHscEA:9 a=QEXdDO2ut3YA:10 a=PxkB5W3o20Ba91AHUih5:22
 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_06,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 malwarescore=0 phishscore=0 clxscore=1015
 impostorscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130077

On Thu, Nov 12, 2026 at 3:29=E2=80=AFAM Ronald Ouyang <repaxan@gmail.com> w=
rote:
>
> I tried the WDS support added in https://lists.infradead.org/pipermail/at=
h12k/2026-May/009382.html.
> With a ath12k WDS client, the frames received by the WDS AP had some extr=
a bytes in the beginning of the frame.
>
> My understanding of the problem:
> 1 - this is a WDS client, 4 address mode.
> 2 - on interface bringup (ath12k_mac_op_add_interface), it has OFFLOAD_EN=
CAP_ENABLED but not OFFLOAD_ENCAP_4ADDR.
>     so it software encaps the ethernet frames and sends the resulting wif=
i frames to the vdev
> 3 - on vdev bringup (ath12k_mac_vdev_create -> ath12k_mac_update_vif_offl=
oad), it has OFFLOAD_ENCAP_ENABLED.
>     so it expects to receive ethernet or "native wifi" frames.
>     it also sets OFFLOAD_ENCAP_4ADDR but it's too late here
> 4 - the wifi frame from (2) gets passed to the vdev marked as "native wif=
i".
>     it already had a QOS field in it, the vdev adds an extra one when doi=
ng the hardware encap
>
> This fixes it by setting OFFLOAD_ENCAP_4ADDR during interface bringup.
>
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
> Fixes: 729cad3c3c9e ("wifi: ath12k: Add 4-address mode support for eth of=
fload")
>
> Signed-off-by: Ronald Ouyang <repaxan@gmail.com>
> ---
>  drivers/net/wireless/ath/ath12k/mac.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless=
/ath/ath12k/mac.c
> index afa3556480d3..1b1c3f738590 100644
> --- a/drivers/net/wireless/ath/ath12k/mac.c
> +++ b/drivers/net/wireless/ath/ath12k/mac.c
> @@ -10275,7 +10275,8 @@ static void ath12k_mac_update_vif_offload(struct =
ath12k_link_vif *arvif)
>         if (ret) {
>                 ath12k_warn(ab, "failed to set vdev %d tx encap mode: %d\=
n",
>                             arvif->vdev_id, ret);
> -               vif->offload_flags &=3D ~IEEE80211_OFFLOAD_ENCAP_ENABLED;
> +               vif->offload_flags &=3D ~(IEEE80211_OFFLOAD_ENCAP_ENABLED=
 |
> +                                       IEEE80211_OFFLOAD_ENCAP_4ADDR);
>         }
>
>         if (vif->offload_flags & IEEE80211_OFFLOAD_ENCAP_ENABLED)
> @@ -10939,6 +10940,9 @@ int ath12k_mac_op_add_interface(struct ieee80211_=
hw *hw,
>
>         vif->driver_flags |=3D IEEE80211_VIF_SUPPORTS_UAPSD;
>
> +       if (vif->offload_flags & IEEE80211_OFFLOAD_ENCAP_ENABLED)
> +               vif->offload_flags |=3D IEEE80211_OFFLOAD_ENCAP_4ADDR;
> +

It would be better to check vif->type here as well, similar to
ath12k_mac_update_vif_offload(), with explicit checks for AP and
station interfaces.

>         ath12k_mac_determine_vdev_type(vif, ahvif);
>
>         for_each_ar(ah, ar, i) {
> --
> 2.56.1
>
>


--=20
- Tamizh.
