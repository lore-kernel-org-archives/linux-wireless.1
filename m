Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794601783;
	b=bG4e4bfn+N2zBtyih1E8MSTpYWq3RPzoPabHnk45Hu9Ow5knBkG83ZVw07lP4zbtV8Mb
	 VI9eIpkHusaiGN0VnCIgZdYPhJdLHsBQ2/2kOhRsqHvhNMQeULarbxfuyCcU8XZ7mKsIc
	 IgZF3f/iK2Ch0EEN1BqQqjIjLsGG6k6W6119XMrICpTUBR0LNE84DGLrh9sLkM9dDctBM
	 4+q521hscR2K00BhAUOu/5JPn5tQkGl6yEyolgQdctO821SX0DS3MJk1MvymSQWNw5VcK
	 DyMPb5pKyNIi1R42vVVDNaEYScCoR/LaVAVmpLO/SstVi3eMDlDVGOZrEm//qWPmBSQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794601783;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=BFe+AyFfsmZF4om7iPqNoRuz2TcNc0/Ih+4asOBhSgw=;
	b=J51S79fX3rrHsQrvbxF4FOb1Una2KaI+xCxPP1iYeQbk28S9qm7qppenSpHD84v01yTp
	 nlfYC4VxU4gnIGFlfUvt12aYFoeQa0Ts41y+1OhRjRM+Y9qc9MlIHkzOfnK5yoYoeNpdX
	 HGkRpbv8hIKT1xl2EXyyhZm4/nv4AZIaMJG+vmdkc7Q05trsEJsxjMLlBcuX10pdLkozQ
	 iuxQEol42W7+2FbSNbSqDL4PdQHaVi4yVkndUBo0qfFgr8Y0c0VYs7HW9SzrONExNDvJ9
	 6/xvNPaz6QXPr5sXovgqA+X72sK7xA0w4nFs0AtoyRLzkFPl+v73F2/eV29feEEcVSA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GOPLmYEP;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kAi5Ok25;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC99C606A323
	for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 20:29:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DC99C606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GOPLmYEP;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kAi5Ok25
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADKKH1p2488407
	for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 20:29:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BFe+AyFfsmZF4om7iPqNoRuz2TcNc0/Ih+4asOBhSgw=; b=GOPLmYEPh04PW3YX
	8Nce5qkrKkuCVzrvmL8eqNRNpEXIcE39p8rP84n7/YuLWEdpTjsniYwZ6PDKMdgE
	BI8MPd2uhF+sNSKaVSA+VTcMEtvPQ9xRWRyCDsjgZFNnB4Ul0Llw8t+IYifWajjS
	VFovn1KxgU/CoGj+4YvFdi4eocfbPUewsja0w+973/oX66H0Sy6Y+EV9jKMOxbGu
	pCXj5pBBTRAv2O0A6RfvoLHXuT9khGBZVRD/g4hwUZTUZ776dLw6mUNv6lo7WNHL
	wshPZEm4MB3GFDhd7iO6Gxui0klUlhi5+m5oJrrDxBH0XY+p2V3SY4KY5q+mMbSE
	4mS1gQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hx1bpa3eh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 20:29:41 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3705e64aabfso154344eec.1
        for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 12:29:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794601781; cv=none;
        d=google.com; s=arc-20260327;
        b=dN7/u7OVo/Q8+snDn44MgiWhl0bhkBhdYQEpo1irfi4IH/A4YkbzVHbWia30OQ+YQe
         hFeT2JGbcemo3SaKsWqKPSLL+37gIXF03hbwK+H/x/z/RRd7GswE5wAIbMZWnMGIjG26
         5JUjHw4uiIBIHvXRAsDv8fWKkltOTfzcsxlqgxN+IK+X1pQ1yKa7YAfTTl34k09QRKr+
         V7MjyjF4A/jhWqvoQIxcsllPJ2Ook/xS2ZA8/Abvqft52TK77sucqA/v0jDaREpZAVr9
         jyOIFW8n43YFxSYCPsbv6SYKVgcRXV7P+qCtpsrm48uFChRMnisrrcw1FEjVDZTYxJ5g
         t3aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BFe+AyFfsmZF4om7iPqNoRuz2TcNc0/Ih+4asOBhSgw=;
        fh=I15xroYIBvm21oDYVSxQ5BC6B+bkxbtgFP/kYv1fqiw=;
        b=NjIFfkvMr+ZhFyR0UIjt4+jK4YM/qOqW5efXUpULNpeI9CCJrUENQ1Gm8BHc8dPyqH
         /pIOdhYAFEK2g2m29j6+vWcGY8QgI3/nJ/scX/vOYXCRvXIXvOoIv4G+Ch3HbI+I3Jye
         2wGASSjysFjALD9jow8V1eZW4GLgr1EDUU6u6GOkIQN/c1/kNRyhP8BOeO9ryDPQWfoF
         DB7fK+qDNK4KEKIHF8hb1Juhr1yXWpc6pVaQrW3hAG6CkmuVu0Tw2oiffSHN/7wYeHco
         aiq49D4IjNzfT0ZJqpAsPs/xLpwloYpMDu34CwFGxUraDfSNkmV9KaRhnihIDvEHBiKy
         FKUg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794601781; x=1795206581; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BFe+AyFfsmZF4om7iPqNoRuz2TcNc0/Ih+4asOBhSgw=;
        b=kAi5Ok25/ag6S8MBX7jiyhsAEMyrDVFxhxW0HYJ1aJ2nGKkWrPCbhZy9AYf09tRmnC
         aEQT94ywB+TScprdvj1h5APzrg5CPRxvTslYlrQKNebAEcOBMozhx5VnxNJq+gabJlYo
         A1kPUmOsydZvhdCMFBWk5NMofJ3eNbGMeZ10qat1w/YFi/77WdREwJJV5LC/0AtWYC7J
         5C+TxBhpkI9rC3ziXVMqYkmOiApYKRtX9QJj3vKkVG35JaInIwX6Ky6z2FKiqZ0R7sr5
         8IPitT5HsPXdty8h3VOUWgR7gfEJGbjXDdrChNI507HSFYNo+1Up/Ew0h0P9HouHsJYO
         Q/mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794601781; x=1795206581;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BFe+AyFfsmZF4om7iPqNoRuz2TcNc0/Ih+4asOBhSgw=;
        b=QbL51WloC1kKMxwsy0vHRfR0gsZNUs9eOsB2+kw72h+cq/9ywZLrQRXnvFX3IpB0+B
         QaKlKCRP5qXpeKx/m/A0itIu3ucR+M6Mk47bjk9IEKdUBDVHay+GoxtmXtrkQjSPWZcW
         ACTFRS3ZnrHsk1sxu2gfTpQCjLljAEMAi9X0NvMc8YTU5MNJE2kfxMF0HfI6BdR7+IPq
         df3MjU+ywTcil5afjM0TcaweFpznObA6IOKKYKaHs/ASURtdaQcaGDDTpw9Z+pnYVwkk
         V+Mq1mGLzu4WkQKoO9UBPE35c/vT3yYvbRTp1qQIbM5LLGgj0p7nztGV7ErSGprDvrbE
         l6/A==
X-Forwarded-Encrypted: i=1; AL+hErHLp5aLEGtM6XV4oCYlznphjqEUEhkzA8NZxivWZS9iSij4SCOkQuQHjUFqNkJbpFyNeJ+IpNdNz2KYlmMTeA==@vger.kernel.org
X-Gm-Message-State: APuU4Z/giBmbALXeuirVa7K1rebsoF3awDNwBQ2E7bgQQ1twxP88N9Iw
	u24k+vQXEfXXqJGu0711NdNg0D94FpOLiMwitjK9LqmP/y0qJL+MXRQzlJ/6BiwG1ddn7NQ6Buk
	1yE3v5oV2HNEPk6PCZSQMK+L5LZAZU/pko+IikQdzv67S5b6XHcuuyxE9zkMAcUZrhhz62xuYQD
	cHEj1YT1aOb9hlr/O4YK8rOMAiO10M+GdmVC5CKM6sjF2w
X-Gm-Gg: AYBFou2OxOcT9zu55NwXf7fKvDrF/128Bjjo5UHM1J4soWynp0/3nwxATsTTAqhHGBs
	jiSp/DYR7MBszjwCv0+Ha1a5R1AuwP2yxu5x7ehdloEs8nfrSM4Jh1ruNjrQx54uu88hgt7w0FU
	mDlBCEQ0UguDSvZ0nKkf4b2HO5xZTzBRs3KztRBvHuDogw03DZLkYaEYRckyVUHEEuVm0HcZk1s
	kpJHc4eDQCFqVeIJA==
X-Received: by 2002:a05:693c:8204:b0:372:c0ee:875b with SMTP id 5a478bee46e88-3796057b529mr4590528eec.0.1794601780461;
        Fri, 13 Nov 2026 12:29:40 -0800 (PST)
X-Received: by 2002:a05:693c:8204:b0:372:c0ee:875b with SMTP id
 5a478bee46e88-3796057b529mr4590496eec.0.1794601779900; Fri, 13 Nov 2026
 12:29:39 -0800 (PST)
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
Date: Sat, 14 Nov 2026 01:59:28 +0530
X-Gm-Features: AclHuK8RT9v9dug-GCIyDGLN86sk991awGjHBNSSxZ4IERLQW12YfxPL_9Djvus
Message-ID: <CABkEBKYwC4h1Sq0cpzTwfBm2obdK8EBkvgk1ZOo+XgtbmWsRWA@mail.gmail.com>
Subject: Re: [PATCH] wifi: ath12k: set OFFLOAD_ENCAP_4ADDR on interface bringup
To: Ronald Ouyang <repaxan@gmail.com>
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=W9ytxhWk c=1 sm=1 tr=0 ts=6af77335 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=JfrnYn6hAAAA:8 a=pGLkceISAAAA:8
 a=uwKDZdRe1lDUAdHoeJQA:9 a=QEXdDO2ut3YA:10 a=6Ab_bkdmUrQuMsNx7PHu:22
 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-GUID: gyv08QiqjU3WMnJdHsrDecah-5J1CNXo
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA4MSBTYWx0ZWRfX0CqxAv2+zQ3O
 VocTigRSSCABolkZcpgHAL4cc9an1p6XM9SfiPRPxojQi6PYM4LoaGz6GR+K/myJSYZsNnM/Yst
 qrUnXpqmgGWNpx9YkQBbTIcoUarD1DE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA4MSBTYWx0ZWRfX/O3k3XNM+FJY
 b7/bTJb0kLEII0dqgsOZ2I7yXMYNOasILVRuRJfNqsg5s1Mgb4sXpkxSnHdBj4kl3/jjUIBdsXK
 QdgQBnFYgCLppv7QEZWGo6/lQEmCLMyXXWpUaouGH+qhLf3hSYZaWF9sG0urnF7ZDxHq6pN+y67
 HSkCEs4otmPLqYuR/uYSO6WqPzbTChpOwlbbhNGOC3inngZqeeN6jLMYzlQbMENCubANK8ntwwu
 gSSfhBB9P/vWiSx5ZmjFmMr8UM0l/WovOht1rw+jF4+yGYWiyH90hx/TdgQy3HqOaMv/mh/KQCx
 G4ga0vsjcnfV0vkm+9tZLOWOZ2uFzY+02VLnulZvx4blcSQ2ykgn26UrCr1cvvyLRFEeTWhGizh
 NkJfIICGjgYF9eGbVZnXN2Tf1tAz6BQfQoEorVwpAsPXLGIK6Zr6gp2fL3Lpx6z+rnWlUwQ9UKK
 d2bFutm9geGyvIViDJg==
X-Proofpoint-ORIG-GUID: gyv08QiqjU3WMnJdHsrDecah-5J1CNXo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_06,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 adultscore=0 impostorscore=0 clxscore=1015
 bulkscore=0 malwarescore=0 spamscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130081

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

How does mac80211 queue a packet before the vdev is even brought up?

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
>         ath12k_mac_determine_vdev_type(vif, ahvif);
>
>         for_each_ar(ah, ar, i) {
> --
> 2.56.1
>
>


--=20
- Tamizh.
