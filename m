Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794992043;
	b=z/NPH2pLyqCBtF28MHfVq0rrwolFISPvrz/z/GiC+uVQYKxrfLF7DFtYKVc2VqbV03Fe
	 B9E99LolStP8CbFKHtHl/rV9PBmuwMfn4JrKbcKGt6I4v1J+th+WYOoOVsUKtTNkXDUWe
	 rC3UnvsKkldArOSm01rvc4R2PmuxZ/P5Ij9/Za5gAq6XI/LHGxX8gPBrlJ4ds/txV6s/2
	 /LiHzgDGZgEJKsufLJfEeAq3ymF+3JnsnrxLxBP9mx5OJHaJDJPCIL/1WLyqomFMDt3wG
	 fVF07hOUIoU59uWD7hDKvGZb12yP71JR0SHrm0cG3SIq9vWwtzp7MAi36cqSJiz3cGA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794992043;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=letKmOg1sMGOEnWR6Ub6ZHNwMqgbIVFnL3jsf5K5z7k=;
	b=zyGSBMNuLrk013cQvZQB7pHMjuPSwZeXCrqgeWdpRTlWGKx1uzL91eygfcXCt37QHjeX
	 oOadXvC01kKki7iI1+4YCNghIrhfOk3XX4Z0PWCOfN7BuGxwg4A1wz/f40JK1npGio9gL
	 AZAjnIyP8gWdNoiMQ4GOnxCYfoY49Ifg5/XexCJb16hJCWb2dfRTEtLKc9es/8POoBPbE
	 1l/MyIcezWMZo6wGNdPyddlMwRakAFgNdb/+dUy8mrHxTg6kiTmZoWlTJnWqWQ7PSmOuI
	 Em5rGBN1bcfyYaUZPBo2KgZep7BgbP7AdAD/g3fgDxNM5gGFA140eRCj2fUpag+7bdQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KpY24obQ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dTreIJw8;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 069AC606A32C
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 08:54:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 069AC606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KpY24obQ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dTreIJw8
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI8eDjp472539
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 08:54:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	letKmOg1sMGOEnWR6Ub6ZHNwMqgbIVFnL3jsf5K5z7k=; b=KpY24obQq/1+/Jxl
	ErqTRoLkxNX6/ACBygckixxTMptbDZpaP4p7BxVTwBl8XNfq0i33iIUpDCfhqLjd
	7O9Fmc/rvXN8BVKSyFE/lQS89yhCIUfLFv9GXPljM+sNN0hj92U4DNmoRvXpSKxb
	PBRRC5FK0rZwKv1BJ/R3oDqQRNOPQfgz2OWe3UVQSNcv8ogGUZ2ogu6dlp8scUgf
	OLWRABD02vCfr9kExjaQYbb9BaBusmnwrdJolVwtVpjsfh/SyR0Bl7IYLno77vV/
	ULB1tFZKbNBlWoW2uaOk4/7LbPVEniqSZIr1Ti8QQvBmUltwLgxTkzrdIMdhqxZ4
	1eJntQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv8a44j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 08:54:00 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f26dd2165so212548885a.3
        for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 00:54:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794992040; cv=none;
        d=google.com; s=arc-20260327;
        b=ic9v4nLFcVwJGjQNjZcRz4Qi0MLXuEXuN1NeJH3ctjBDOV7XiQ4pSzHvtt/cQsRrJF
         oLco1jYat6YZWeZZeq9dQO0z/+f5XlRyCSm6oHmTEP6IyobLtXiUNlzmvsLfWdlC9q6G
         6d2wSL0QnbunO8ANm/rTwosT3pz+BLcFDhOcF0Iyjqia/GmL7sJaMeWUFpa8ve1M5V5r
         vQXLuR6iP1ezEd42AsUY8ZDgaAeFd0tmHrl96EX87m7gUX4GljB8nsuICmUf0+3Am1m8
         xHrAuKvFHWUSjwS4PCq3UVTd2bNNGIXSTy9+zmpzd0eAfGenFoQbAa9C1yyXBqoo9ckX
         I6nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=letKmOg1sMGOEnWR6Ub6ZHNwMqgbIVFnL3jsf5K5z7k=;
        fh=0Pd86gS/DqJKcFM8tke0lbnYyUm+o72v+YiKtE3RxrQ=;
        b=VvAO9hkU06quun+fmkdQsx+dEiuysq24bb+pRxpNnr6MQdC4JVmVhLBIWzUx4OdKvs
         xER4+f4B8ufF532RmeIlSKI2Peqiwh9h3zg2uvchaYWIqZ6my/YCLH5g2n7elqfoYqha
         wtN39Yvfny76w72vYKcD+hG/6McWz45ryD1t8oymCsJKOcLZKah/9VCL8vCd9g9k3Q64
         rShkjfotq1bu8uZYqYGVDYUK+MWVY6/rR+LPmNC9nFEkKiGAEI43qm6YVqlkKP0xprP1
         4zrZkLHhsfv6tDdoiGaYBIQmjNfuPnnmOg09hMTyWHksp81pRDqp1IqHL1/FIvoGhweM
         jn+A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794992040; x=1795596840; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=letKmOg1sMGOEnWR6Ub6ZHNwMqgbIVFnL3jsf5K5z7k=;
        b=dTreIJw8S8ykqG0OmD+nsQEfh9ScwI6ONA3XLwihzR0SNM4tznsJ9EOB+F6mMrekS+
         Szgb7UP80Qf7Cr3f/cA3bIOZUuBaBTPBGPeA7pgsVwnbVY+igLa/tnP+QKdVInK9Faik
         kT5BgxhSIPlxGiDxPDbd8wCrNhyy5EbfldVIi5IyU3S/vf0lFugskBQhiWBSjym2M02D
         Jo71oULjzYwUtvmZner+zv/SivLQlOzkHxSv3WvC9ZM1lk9sUabsZ0z02VK6C7TxcuWY
         XORZ9+5wHuXpqpZNfrkzJrN1AJ0PgNfycevLvIpE9evTur4fC82VU5aQGxae7MybVv2m
         8D5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794992040; x=1795596840;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=letKmOg1sMGOEnWR6Ub6ZHNwMqgbIVFnL3jsf5K5z7k=;
        b=fQVY3rSKyrAN7cc92PoNli44TbTq+LF3cmaJsrrZyn/UK2eaJ2FRHmPBPKQJcIt22N
         UdiCHMVgS2nuHM5t9yE+AI2I0PVh7kPXW0hgt1ajvgO1m2lJeFGPNk6Drz0DqOb/fG+v
         NRS/a12cE0sOoYUj5nW3rmbi5Re5SxX73KeLjlzpUdBhkBUDJbTqLIC57TLe/caWsJAZ
         zeKYV1hS8Fxm1NXaFquf/vphRiMzYYaEMlEUD17cvEG8TcSSlfNKoY0hwweo/TAA5FNP
         vSDT3o6dKrZeZKXUigowctCuWTz5Wv1s12hXZFiUWoIDG6xomZRU3jNGoPofe20UdPlo
         61WQ==
X-Forwarded-Encrypted: i=1; AL+hErGTHTnJxl3eYB7I3X9S5352inu25KLI50DKfMm3U6l3xQu6A460J+lyKuzeZ0oN4l8kDxbr5TIBJ3cSwo/R1A==@vger.kernel.org
X-Gm-Message-State: APuU4Z+tNMz5aZf3LZXasSgI8Hj5lGPaiBOuC6UKlFMfPZZ+zQHtbvT7
	MvQL8Xx9kIDDTRzGmx+g7Usv5vtw5hMMAvNkwMsXoIM/AUFKA/fG+qCFzOA9rATPi+USd1jGsaI
	wQVeEsGnMciq4NIopkPbTyLQLoip+6bu6fnGkowTrkeHZQOfTt3IVwubRC19GPGoa754o34dfzA
	nehh+jidCFzX+k4v7qrDTYhwGe9FH2bWHCKCvYNS+bbcL8
X-Gm-Gg: AYBFou2zMI24GG2SfLg7ugwZdiCToNdZC/X4brXKqzKkGJ6EzLzANMHorX6O+903TUm
	S6TfYITwNIy3xivW8CAcWh4BUiAOJ0mDSH6eolg0CKGO3OizC9S9++C9wqkbvn0RWCQA2LhuW8C
	Lb7uQc7DTKjGPVs/luWYIuoDs5ALyKm3Tz1XowHE4fdiW/1JX0sRtbGGo0EOKKPb8CFi9fONUPO
	KxQkajseGvaHMkA1ANN+vKGpxSZqcZdnYAEKytdNDNCIisB/wOfPL8hy+ugogCl43JjsvfWrkfw
X-Received: by 2002:a05:620a:260b:b0:949:6574:f36a with SMTP id af79cd13be357-949995b3c61mr358671985a.38.1794992039981;
        Wed, 18 Nov 2026 00:53:59 -0800 (PST)
X-Received: by 2002:a05:620a:260b:b0:949:6574:f36a with SMTP id
 af79cd13be357-949995b3c61mr358669885a.38.1794992039459; Wed, 18 Nov 2026
 00:53:59 -0800 (PST)
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261118052116.3901761-1-lcy8047@gmail.com>
In-Reply-To: <20261118052116.3901761-1-lcy8047@gmail.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 09:53:48 +0100
X-Gm-Features: AclHuK8sONdAXHDBXSHnReUAAHAsZCMvEJNaHxHQtWOAW5ELRw1-8RjKZhSzGYQ
Message-ID: <CAFEp6-1h0iwXtPr0HXVMceSDdQ09KPYomt58Nme_AzXy+V043Q@mail.gmail.com>
Subject: Re: [PATCH ath-next] wifi: ath10k: free msdu_id and skb reference
 when HL TX fails
To: Changyul Lee <lcy8047@gmail.com>
Cc: Jeff Johnson <jjohnson@kernel.org>, Wentao Liang <vulab@iscas.ac.cn>,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: AhZozekAY89mYfMTmbVa476Ftx-OtZlV
X-Authority-Analysis: v=2.4 cv=N9u8hG9B c=1 sm=1 tr=0 ts=6afd67a8 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=pGLkceISAAAA:8 a=lJo5bTS-0ZoCzmS7HdAA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAzNSBTYWx0ZWRfX4LxeUQupjkzp
 taZOkl53aM6xuF23S9JVNdEDpp12m7IJAMvMkmdVTnt67BAjPTWnfvnSp7cTo01wkHEgSDw0iq0
 fs4++Z/cPlsC0vF1qPkbodFkvhj6cTlPdbbYDSYahYhwx7U0Yno3cOcMgKH1uN/+Ugm2gQPvTyA
 ORxjnoGTeuiFHz8IKcba5kqqtgV6vS+mpPRhAZZ9tlBle/HkheSFz/rf7mC6xS4+uItzIKnbhG/
 2Oxb4ydo6Vr5E8KEMFurGCiY37mp+nLAB74pU/XdAq1hl6/nKt/ZTUNKWVa5plOJQv88gIE7zJg
 AuzQh9BrFjSUKA8I23unB2abAwxlBrt3kITGJeT9MdJzZ4YVWpWmBpEpTvcQiNi8SdI/+hEsjVk
 mgZfWqwr6ARSqXOXmNeuXrC6UXLXMKbxuaja+uI8aiz1H0n2V7kmL1+/zwyJF/G3eIIwwxh1Xgp
 1fp/Xih/IpIv8rUnGrw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAzNSBTYWx0ZWRfXwlv5qYsG2J5I
 C3dxD6hZDZ2uqkwHE2/7UX/XTJLKJk7Ev6zBLOgSsm2J4ba/EQr4In/o0vmhIsdA1cSPNsr+YDo
 dZtdsLTMs9Cn4yEAVfnof0fFVk7BHkE=
X-Proofpoint-GUID: AhZozekAY89mYfMTmbVa476Ftx-OtZlV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180035

On Wed, Nov 18, 2026 at 6:21=E2=80=AFAM Changyul Lee <lcy8047@gmail.com> wr=
ote:
>
> For SDIO and USB devices, ath10k_htt_tx_hl() allocates an msdu_id in
> htt->pending_tx and takes an extra skb reference that
> ath10k_htt_htc_tx_complete() normally drops. If ath10k_htc_send_hl()
> fails, for example because the endpoint has no TX credits and TX
> bundling is off, no completion runs and both are leaked. After
> max_num_pending_tx such failures, msdu_id allocation fails and no more
> data frames can be sent.

The above message looks too verbose and confusing for a somewhat
simple issue. Maybe this should be split properly in two fixes.

> Free the msdu_id under tx_lock, as ath10k_htt_tx_32() does on its error
> path, and drop the extra skb reference.
>
> Fixes: 8ea51e409eb0 ("ath10k: htt: support MSDU ids with SDIO")
> Fixes: 30382dd1cf3a ("ath10k: fix use-after-free on SDIO data frames")

If this is a fix you should not target 'ath-next'.
Two fixes tag looks weird, what are you fixin exactly?


> Signed-off-by: Changyul Lee <lcy8047@gmail.com>
> ---
> Found with a static analysis tool we are developing.
>
> Compile-tested only, with x86_64_defconfig plus ATH10K_SDIO, ATH10K_USB
> and W=3D1.
>
>  drivers/net/wireless/ath/ath10k/htt_tx.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/drivers/net/wireless/ath/ath10k/htt_tx.c b/drivers/net/wirel=
ess/ath/ath10k/htt_tx.c
> index efaea150025b..b437b09717e1 100644
> --- a/drivers/net/wireless/ath/ath10k/htt_tx.c
> +++ b/drivers/net/wireless/ath/ath10k/htt_tx.c
> @@ -1378,6 +1378,14 @@ static int ath10k_htt_tx_hl(struct ath10k_htt *htt=
, enum ath10k_hw_txrx_mode txm
>         tx_desc->peerid =3D __cpu_to_le32(HTT_INVALID_PEERID);
>
>         res =3D ath10k_htc_send_hl(&htt->ar->htc, htt->eid, msdu);
> +       if (res) {
> +               if (ar->bus_param.hl_msdu_ids) {
> +                       spin_lock_bh(&htt->tx_lock);
> +                       ath10k_htt_tx_free_msdu_id(htt, msdu_id);
> +                       spin_unlock_bh(&htt->tx_lock);
> +               }
> +               dev_kfree_skb_any(msdu);
> +       }
>
>  out:
>         return res;
>
> base-commit: 4016f6c3149e7e3faccc1654db6a3030c069383a
> --
> 2.43.0
>
