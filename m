Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794565604;
	b=0fbMh/IbtZ12LRcXWNdICmcqyaXWLoKUByG6ubuUm24hZ+63JFUt8sepAoxG+62LCsJE
	 Rc33QBZLkvfnvd1BbAjhpEOnoOf4GZSLxuOw1EXWFh+wAW6+6T0Hc9jWBKPncmMR2pKtN
	 aKMyokD/vxv4bgo++C92UXNHe1C55Ezj3X4a0VoDvcyZzArhGQksVRZ65JhAkQX/7EMET
	 1sRnyHVbZFaIt7z3OPuPa7ZDY9Cab9EZxJxWBHartyPZCD9BWNZ5LlCLhnI08wJ/qZr7Q
	 fCtiKJVvpTtrghaNV8G8MUG1qBv2zJ9ulAkPkWaF13qXI8mkHHZxLyUpwzTfC7ZTXVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794565604;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=E2CuMJq93HBm3Qt4pvRzKdiLs4s9xzGSgrnBEL2nArk=;
	b=BkUlyoDTq780p/AbTGOKq2g7kyN07l3FyyPPxV7BoFOYguMpHuNUHWBg2l0IZgK1bGHc
	 sS0kFRpYDgj4xl9/DWzzEdPXkPypppo2WVCTg7aUc6DbhLcpV8UwyQ/I+gZx31lXdrISC
	 PjFemC/D6iRRxPsMQVEpocsx2Niq/Ll6gtiN7IpDmI7gsVdt0zbgxx6g8LPSryOPa3MQU
	 W9uKtFllpKZ8QIxII6MlmMW1AaqwMyX/jExGEXIXPvaRGFjR2TEUEZ+r9h2JX92SKVfWD
	 +i0IYXa9S1rH3ZjwsL17jn0VsAIyZgUJIGeE3c4RchTq3irkO7kRMssk8N2fjKeB7Dw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LWFwYS3p;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gkXWFOY3;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AE06606A31C
	for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 10:26:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7AE06606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LWFwYS3p;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gkXWFOY3
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD8VDxl4163558
	for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 10:26:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=E2CuMJq93HBm3Qt4pvRzKdiL
	s4s9xzGSgrnBEL2nArk=; b=LWFwYS3p13fiStYYe8DAMHGdJPS5Hn3B5WxRMEpV
	I3XY0irpzqDF3wq+Hy1VNdvsyexB7osH2YfXHx+Ms4MrKOwVP8kIFSoDKHUxnsOB
	1RbnIzgZ+R5lt+WrI8jZFzjM6mEVU33LE1RF2E8Zg5iL5cdriOSE0yMsjC3lK4Br
	ux/M5thdtOMivP88PNX1YfUEs2BfKE2Oerml4Bk24+BKXUzhdRDdu2OxswJfx85E
	2BChRBZ+PARQabUBJyr880xGDWBmVgK27Cg/BZfpo9G44zt2vTYnUsdxQp2DMlHZ
	LTgIz/tDRpu6XyJPFFi2Spt3cRzllhYEdQHsKG6geXr8Jw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwh0ak9t6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 10:26:42 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-94776ee7bf0so126376385a.0
        for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 02:26:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794565602; x=1795170402; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=E2CuMJq93HBm3Qt4pvRzKdiLs4s9xzGSgrnBEL2nArk=;
        b=gkXWFOY33IPdxAM3ZJ2TKyN7yDF6DhjmGPaHnE17ZNkjyAvnwju7Sdb78BHNRU5l6d
         /Lf5LloPL6ezsDM84/BRlUjRjvXuztvmAEf7z+p217DnEvNVVvIx75pok7LoQjAju7zV
         AdjQfp9pOuKLsdV+6YAzqj9NSmIojop4Oz7zHWcdpuRkkX3THqZzTho9Q1OIYF/NLn58
         p3Tie0PICjzukSzViYilCemCNO443AipI+ddtAT7NXRdQUeHGDak9Omu6A2AStDzDmby
         wwLxceMA9SMU2AaWl2EMatr6hANmC0bIx1eeudUrz3/u2XWzaxdbDPvtWj9UH7qm2V/D
         LayA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794565602; x=1795170402;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E2CuMJq93HBm3Qt4pvRzKdiLs4s9xzGSgrnBEL2nArk=;
        b=LaoVIJUxSehp9f2c+09YkZ0tBSrU0v047SwVet1ihogJjjyX1CD3PXW06iWjN98dhq
         vuEG49vJuO3Lqgu046M/8kr3k/SMWdpcEXZR8rVWBnsfum46hXyYXuoLDZ4Z5AN5ooyG
         EfxA4DPqC+oXami+WUEk4j3qQVCMRRuKdKCeWZ0e46VP4jXv5Z/QgcOyHiPose6iHz5R
         5DiCFujzU3HisQNQ8R8s6yAoWtspHJsE62fo301ADdpp0ID1v6u6qGfqPys7aqRVQa0M
         VM/6A21+2ONyQv2W1w5HrVotZ6mYrEZ6pTrmAF/dRkFQq/SnN8CikO6XZvZkh6bKSbdB
         krdQ==
X-Forwarded-Encrypted: i=1; AL+hErGk+waXCCzgtk37l03TQKNpWpyVR4G3DBb+aUz0ZKG1I8LRBFNgOiItCthdSAiliAupXkqN1WiriUw5DaT29w==@vger.kernel.org
X-Gm-Message-State: APuU4Z8N7HGRKyzjPL5wkHUiZBYFd4P+EKTqv4zDMHvsKGordy/x7Qjd
	q1EQEvIpo+TT8nVbdp/7NbuK5UY9cXTq1ChuzWrkGVTmvgCikeM3+gi0HrSP8WjnjrLfWRLqTgT
	mN6E8IhaAJhIUvDLYxJwSkmkXxZMOAMqBR2F41/H4rNPMqFRfxmtQlnFau0CLMM7g2FQTsQ==
X-Gm-Gg: AYBFou00U4/12H8zwTCloPC1YfhshhDGcuUfYqNA7nj3b1uI1XLMsmQgy7EHWOgJ27p
	jQLkzswGOg0KfFQ6P4lrJsUhD0sX0y4AVcFqG9I2asrB4LbCIvapDaG6Glb7tnw4HmdeLX2vSfd
	aGje6bEfwHm7kmI+0UNNhN5INWOOTZ95SP22JSEwTqg6bHyK1ZUEt879GQF7C0dCwIgozMFVnUG
	jb7wrzZcaicfJbnIp47DJLbdX8fNWj7vYptjF3/wl1PX3tu0Ju+ytQqvuNhBeXIrp/Yd4wi8qcc
	A9PkqhFs+8uR38UFQgn5X9LGW2OkZ4k9RuUQJHdT27Lpy1o81n+bkGdevpKVL5f3atbtGJAiUvm
	1BjRVlMRBqgIdkfZ/CIaMl0dzOyMLpW56+6VxThDfrV4fqFHTzdYVk7NtAMOiYQ==
X-Received: by 2002:a05:620a:6849:b0:945:e4ed:d87 with SMTP id af79cd13be357-9494ba7d39emr352977285a.16.1794565601552;
        Fri, 13 Nov 2026 02:26:41 -0800 (PST)
X-Received: by 2002:a05:620a:6849:b0:945:e4ed:d87 with SMTP id af79cd13be357-9494ba7d39emr352972785a.16.1794565600940;
        Fri, 13 Nov 2026 02:26:40 -0800 (PST)
Received: from localhost ([93.66.91.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb571f6a40sm16382245e9.2.2026.11.13.02.26.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 02:26:39 -0800 (PST)
Date: Fri, 13 Nov 2026 11:26:38 +0100
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
To: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Cc: Jeff Johnson <jjohnson@kernel.org>, Carl Huang <quic_cjhuang@quicinc.com>,
        Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
        Bhagavathi Perumal S <quic_bperumal@quicinc.com>,
        Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>,
        Wen Gong <quic_wgong@quicinc.com>,
        P Praneesh <quic_ppranees@quicinc.com>,
        Balamurugan Selvarajan <quic_bselvara@quicinc.com>,
        Kalle Valo <kvalo@kernel.org>, linux-wireless@vger.kernel.org,
        ath12k@lists.infradead.org
Subject: Re: [PATCH ath-next 1/3] wifi: ath12k: validate RX frame length
 before undecapsulation
Message-ID: <avbl3iulRGwsfLhR@lore-desk>
References: <20261016-ath12k-rx-avoid-realloc-v1-0-0ce6cd99dd5f@oss.qualcomm.com>
 <20261016-ath12k-rx-avoid-realloc-v1-1-0ce6cd99dd5f@oss.qualcomm.com>
 <4ae460ec-fe87-44e4-a6d2-e1d7f6391fba@oss.qualcomm.com>
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Gj02mhaqJiBZs5r0"
Content-Disposition: inline
In-Reply-To: <4ae460ec-fe87-44e4-a6d2-e1d7f6391fba@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA0MSBTYWx0ZWRfX96dm3eHZ+qVJ
 qAqDGE13WMfUVnkRYBgzzGJB+LlmWXsEEL9Um+sZNq9QL4xa4W2+thq8jjEU9FRLQlQCQ1wBpUm
 0n3UreXOJ6qyPbys+8+YKg7H9DbIjMc=
X-Proofpoint-GUID: L9VwId0xb12D3hVrdVVC45ekhycNhUed
X-Authority-Analysis: v=2.4 cv=N+e8hG9B c=1 sm=1 tr=0 ts=6af6e5e2 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=vJIuTH4p0ATK6gluz4evpA==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=pf-AwWE2P4KV4mUivRQA:9 a=CjuIK1q_8ugA:10 a=jXzn2BpXbAUnuv-v0lEA:9
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA0MSBTYWx0ZWRfX8ja6X4czkPwh
 msZlIL3H1q69imsUwLE9bupCpuxTClH2M7x9VxvISv7GIrtsKJI2tCCMN8W/OhWohhSMCJdk0jj
 hSHMCAWfmqnfgcnV0P04LSUeE67OrkBwZGjmpJpSiwBQnkD4nySRjN/Alnm5Kz8SIil3Bf69or+
 63tC263cy0j5eLPJ5PxlW/s2afRyC5OOi9Um+tAnS7JY2BSeTk8cChiyYqNwYYh6zl2brRYwMyi
 RYFfDrsaBRhTraOSh1fwJIcKmK2ugX9EFdwQliopqhVVeKQyLTfbdn/3TDvO/ZsWArpD9USNk3+
 OkAZhaousMFp6osPKvs0jqQB3c0oLax2R0AYnPFsrrAqJJM2sOnFiybr/pAlx98SscXpNHH/Vo5
 4t5hDJAsjkdrLnWrSkvI9vp4PJ54GqHALqBPTthWQNF+5cxX3dJs2elFhQIhJpXfRgiJqdnrg8Q
 UNMu3eMBoCE9mGmNbrw==
X-Proofpoint-ORIG-GUID: L9VwId0xb12D3hVrdVVC45ekhycNhUed
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 malwarescore=0 bulkscore=0 priorityscore=1501
 phishscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130041

--Gj02mhaqJiBZs5r0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

>=20
>=20
> On 10/16/2026 11:16 PM, Lorenzo Bianconi wrote:
> > Reject truncated raw frames before removing the FCS trailer. Without th=
is
> > check, subtracting FCS_LEN from a shorter skb underflows and leaves the
>=20
> skb_trim() has the check itself, so there will be no underflow?

I agree the commit message is misleading, I think we just need to return an
error in case the skb does not contain the FCS.

>=20
> > FCS untrimmed.
> >=20
> > Also verify that the frame contains enough data for the 802.11 header a=
nd
> > the crypto header before moving the header to make room for the crypto
> > parameters.
> >=20
> > Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0=
_SILICONZ_UPSTREAM-3
> >=20
> > Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices=
")
> > Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
> > ---
> >  drivers/net/wireless/ath/ath12k/dp_rx.c       | 46 ++++++++++++++++++-=
--------
> >  drivers/net/wireless/ath/ath12k/dp_rx.h       | 10 +++---
> >  drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c | 22 +++++++++----
> >  3 files changed, 51 insertions(+), 27 deletions(-)
> >=20
> > diff --git a/drivers/net/wireless/ath/ath12k/dp_rx.c b/drivers/net/wire=
less/ath/ath12k/dp_rx.c
> > index 36be543b7c50..40b8da34268f 100644
> > --- a/drivers/net/wireless/ath/ath12k/dp_rx.c
> > +++ b/drivers/net/wireless/ath/ath12k/dp_rx.c
> > @@ -999,11 +999,11 @@ static void ath12k_dp_rx_h_undecap_nwifi(struct a=
th12k_pdev_dp *dp_pdev,
> >  	memcpy(skb_push(msdu, hdr_len), decap_hdr, hdr_len);
> >  }
> > =20
> > -static void ath12k_dp_rx_h_undecap_raw(struct ath12k_pdev_dp *dp_pdev,
> > -				       struct sk_buff *msdu,
> > -				       enum hal_encrypt_type enctype,
> > -				       struct ieee80211_rx_status *status,
> > -				       bool decrypted)
> > +static int ath12k_dp_rx_h_undecap_raw(struct ath12k_pdev_dp *dp_pdev,
> > +				      struct sk_buff *msdu,
> > +				      enum hal_encrypt_type enctype,
> > +				      struct ieee80211_rx_status *status,
> > +				      bool decrypted)
> >  {
> >  	struct ath12k_dp *dp =3D dp_pdev->dp;
> >  	struct ath12k_skb_rxcb *rxcb =3D ATH12K_SKB_RXCB(msdu);
> > @@ -1014,13 +1014,16 @@ static void ath12k_dp_rx_h_undecap_raw(struct a=
th12k_pdev_dp *dp_pdev,
> >  	if (!rxcb->is_first_msdu ||
> >  	    !(rxcb->is_first_msdu && rxcb->is_last_msdu)) {
> >  		WARN_ON_ONCE(1);
> > -		return;
> > +		return 0;
> >  	}
> > =20
> > +	if (msdu->len < FCS_LEN)
> > +		return -EINVAL;
> > +
>=20
> every later trim in this function has the same problem: msdu->len minus t=
he MIC, ICV or
> MMIC length is not checked either. should we add check for them as well?

ack, I will fix it in v2.

Regards,
Lorenzo

>=20
> >  	skb_trim(msdu, msdu->len - FCS_LEN);
> > =20
> >  	if (!decrypted)
> > -		return;
> > +		return 0;
> > =20
> >  	hdr =3D (void *)msdu->data;
> > =20
>=20
> [...]
>=20

--Gj02mhaqJiBZs5r0
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCavbl3gAKCRA6cBh0uS2t
rDRMAQCyvkyDRb9Pk8zul/SQoBmtkI7egkUVJrFFvxlluV2mKAD+JKV9lmFVSDlH
+MYqPyUfXSulc8jh4lXtUZ4+1k/rsgI=
=XBf3
-----END PGP SIGNATURE-----

--Gj02mhaqJiBZs5r0--
