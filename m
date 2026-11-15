Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794733101;
	b=iN5gx079lCk1g/8eRxgD8aJAWWTSrgFam6PsM2PrZaUcxncJIX9CEKM+XS4S3qv55HCG
	 FPT27Q9FHNeyUSOlkbAqzcSLX7OK02eGNhrMQ9Y7AbkOOtJXcHZ3Yf39hKdNYW/kTSmGa
	 BnG8W3zfRm+g9swHESROnkjYwvo+CkEF4fZaWuBRgduVm/Ci9P8eONZASEzFi4uAqGWy6
	 gqplCtbr8c0tdK6TiyAmknuw8IaEOodDwk3mMz//ssqqQwDM7oi0HCOnQwEabeAKtNhot
	 ot+0m5utWWdsMb0zWFTfSfrWO/jhyWjLwcAISQ77ly0T5x+bdV3pqFExCVaFVpaIYGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794733101;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=0LvtZuJ5CN6Lr7Eo+zvU6W+i7dFkPmCniuuS67TMBeU=;
	b=Atsuv89Aio5YkHHN+/ciSw3/MDKaR6hl9CUz6ftr/Ivkd4ysRaLJFmnm7p4lL134bmJv
	 2i7ub4uSnJiJzns8HFmATPvn/yz7nOFYxTYdSDDR60HBHFLTCpAbliEsrDqe8F72yVNGH
	 wZ5To0bsckBbtvFWtioaVS3oYkWJGEOAWmjefPsgswrXWaSQFKL5vUGabt0l/4QlEwznO
	 qD69ePH7wsr83iVarELintgaBXKi1nHUNkNnQt7bbG2utkOPfenrf/M+BHir5I9ccq6ke
	 u3JvJsM6SCQWbmV/+mmB3ZlCEo1ePkWmyzCYHmgNuHXbzwzVf4auYvA4h/wC8LRA/EA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UZdzHikZ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SfwSH66l;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82ECD606A31A
	for <linux-wireless@vger.kernel.org>; Sun, 15 Nov 2026 08:58:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 82ECD606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UZdzHikZ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SfwSH66l
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AF7weS02337744
	for <linux-wireless@vger.kernel.org>; Sun, 15 Nov 2026 08:58:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=0LvtZuJ5CN6Lr7Eo+zvU6W+i
	7dFkPmCniuuS67TMBeU=; b=UZdzHikZ3+6+aMpSVftEgb6vf3BLx1ON+p3jnnSf
	chOgOWAtafwkVqiTqXvocXlG2xS3Y16pnKTISaO04mwgqQuMNLqK2vb5x+sFMJGj
	2q7fqj3OU5OmtIbp4Vui+0CCu3b3BISgVzTwIJQEOLlQ4qSeMzqIY9L00DCDaQMj
	YQCe+vLuaZfVX3O/6L+1FCZXpDuzf97DtynGm6QxiYeWDN250Qn6AiJZcMUsK6Rk
	jQQvUrzgggtRUzsSVh/+rPOgs7YkT4NtOQJwtcQjo5p3/rsjjOihKlwvaWNGwQbG
	zTcIfNIFbHUp4ASuISdxrQRM+DvNJEE47x78eTpPgqwtcQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhjqjp3n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Sun, 15 Nov 2026 08:58:20 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93909014c85so52651585a.0
        for <linux-wireless@vger.kernel.org>; Sun, 15 Nov 2026 00:58:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794733100; x=1795337900; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0LvtZuJ5CN6Lr7Eo+zvU6W+i7dFkPmCniuuS67TMBeU=;
        b=SfwSH66leZ2VWDAZIhFN33B+j17ol/WURyJsFXYdgdkqHgVyVn2m4WmBRO1yIOsA5X
         tR+AaSbCm7q1A7Fn9OA7F+cm9nWJxs3Ffazo/nHTvR3FE+cQy58Br4IPOKidLL6C90B5
         Bz4jgFZbEdDsdwMu9GBP11k/vovUctrSE3p6BJVC9xliErRg/reIt+eTqnnAtebiIMDr
         goh/ZU0KcVuj4j4N/F0xcsDWmquc9wa/MYnHmB/2nEeYN1gCcPCEpNvxvDOhTIou4MHE
         N3cQfb6LkqaP/7aH3q3XjNdIqx02vX+tVskBroGD6e06nmjQa9WFf3FZrIqvZYGfVzdl
         l1ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794733100; x=1795337900;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0LvtZuJ5CN6Lr7Eo+zvU6W+i7dFkPmCniuuS67TMBeU=;
        b=JOIEwbtRj2zm0z/nDkM9T5GLg1nixZ4W1/Nbf9/GiIpv0pLenPTKm9r6QtRoaMc/ni
         8DpY6OuE0JCnF5ybbTjErYDtER69JhuhqZz2P3mQsPEfklm+tM/4Hw4slyJ6qNkBVxes
         AJ3iqcxcxhXmoNHIctj/7ctqQJv5Zpgltv9MCu2SpyWj+KLCku50jQVdQMx1YhnILvOw
         88oT9F1ZA6b61m/weqATcQM8+afPsXK4wM1vhenzE7Y2sjuIhlfsXTVdwatuELagqviW
         5iFVF2dkip5JWRAF2xjANSw1sSglK304PXQDEdZdowNcEJCaLYBEDr0vt/yAUR0gYKPa
         zZFQ==
X-Forwarded-Encrypted: i=1; AL+hErH94DOrnhGnawiLL8g7NhSZOz7zojSTxJyyqkVgvxzRtgFA3CeYDqIL1KaAY5JkEo2jjafXGhsLnFJR7dE0Wg==@vger.kernel.org
X-Gm-Message-State: APuU4Z8mKcR2GFJ55wmSd0YA5u178DB8PVnVJpq35+cL2MO+WmRcdqNp
	UcVE5RxKDwbhdxO4kD1tdOFRoz9oyRCiMS4OG0IqWJHp+o6UN5akSRTPg239RlN8q5BTUP5v4s0
	lYwuNdZrNVul/QvUuvDOqeDvcRQ8lGPGU8Wul6uzjxiQv0fpT86t5v5jRi4QC2RsUPdRbcQ==
X-Gm-Gg: AYBFou30EOlnNMwaDsx2VsmL0FJb5UJCNx/9da0/OSQFO5P1jBmCYBta4FA3aOQJKx8
	8ah1PxekdVlRoR0rwue8BGuQfLwyXihHIKko5HG7lwYCvxN8m8i5iJWdHbyc9WPqdnK/4brolDO
	ub4I2xcbOuJfJD+tQ8MM4WTWM76UVMn7qhR/aYyWEOvIc4cxfUvreNG2aJQvsHDKPb9XpqB611X
	EGXBBT+jACYeTp3RfsaVOLjatvxAqc1lGHpsQpw0oEzPDtGCZR76X4znm/vH30on9972HVhaffG
	Mym+pmvYXsXI/0SM0mcp7QtDpdzcz1j+L8ZLfmErf9bLgqihgyM4bsH4sgbPHQzTCgDko2zPaPX
	kCRPTkGtL5uog12bp957/E/eDjzCN+2DvPd9YTAwFRIprWe5RI8iYyhKgQqSLwQ==
X-Received: by 2002:a05:620a:6f01:b0:946:6:129d with SMTP id af79cd13be357-9494bc744a5mr1234052285a.54.1794733099545;
        Sun, 15 Nov 2026 00:58:19 -0800 (PST)
X-Received: by 2002:a05:620a:6f01:b0:946:6:129d with SMTP id af79cd13be357-9494bc744a5mr1234050385a.54.1794733099002;
        Sun, 15 Nov 2026 00:58:19 -0800 (PST)
Received: from localhost ([93.66.91.216])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb5faf05f8sm102148105e9.10.2026.11.15.00.58.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 00:58:17 -0800 (PST)
Date: Sun, 15 Nov 2026 09:58:16 +0100
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: Jeff Johnson <jjohnson@kernel.org>, Kalle Valo <kvalo@kernel.org>,
        Baochen Qiang <quic_bqiang@quicinc.com>,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org
Subject: Re: [PATCH ath-current v3] wifi: ath12k: fix DMA direction for
 re-injected Rx buffers
Message-ID: <avl0KJunNkgixBIS@lore-desk>
References: <20261023-ath12k-fix-dma-mapping-for-reinject-packets-v3-1-443f9e13bbc9@oss.qualcomm.com>
 <92d632b3-3aee-4786-9c89-b106b66a32ac@oss.qualcomm.com>
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
	protocol="application/pgp-signature"; boundary="TFQXiE9/RmqGVScH"
Content-Disposition: inline
In-Reply-To: <92d632b3-3aee-4786-9c89-b106b66a32ac@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: qqpy85eV34-u08l7SDdIsEmiGymYtG73
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE1MDAzNSBTYWx0ZWRfX6hhgMJjbIb6+
 fgEREyJN85QTebia/ohx7hRwAMwspj5xYIpV+j+eWzwm0wQ2242ftYN2KPPxZSGazYmXFPm73LG
 NSPBWj2zdxQhh7FsAJLyN9D6FMq4v8ZRMryn401Q0oiKp5s/TxBFNL1171zGXxGAoehOBj+Ft83
 qHWoVdAxAeQ76EUnz7W0vGkuaB51QKsJuk07/Jq6CVCEpnBOFIAc9+AvfJPeWrF6XGgAT+rw1iD
 gvovaYxeWH8200usKemO2pCQblh/3vZKRv6PABtBBxOfzm8n8CbwKW5e9FLJ6jNPNeEgTaHJmIe
 5DIzyP1U/vqaisPq97kJs7KRWoWGnBa6uKANE2dgjKUks0GKCntDE4RDTT/1sr2MM9C41yYtUzL
 rrVzkW/gCpz9+870ad4cU+b3KIidzOmBQWD+LIBniMItwIRyf/ylUoKgcDkxHqZfgWlgca42pKL
 lSRdqHEVx6oByMvielA==
X-Authority-Analysis: v=2.4 cv=TqJzFzXh c=1 sm=1 tr=0 ts=6af9742c cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=8zQ3sPA27H7dy4zktjPBAQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=2LnXmgUbajm_jcWkuQEA:9 a=CjuIK1q_8ugA:10
 a=CDx97edxcbZoIHJnS8wA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: qqpy85eV34-u08l7SDdIsEmiGymYtG73
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE1MDAzNSBTYWx0ZWRfX8szFgtjQS83V
 SAdP+f0OcNFfh0MqKKA26ncWuo3oWfAhA3eBSecgQCekOdgPFBcLM8MQjQPmhO4VFGlmcrjiqmw
 enJfSIFO41vtS+fL61fNGRxGEHusZno=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-15_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 phishscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611150035

--TFQXiE9/RmqGVScH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> On 10/23/2026 9:49 AM, Lorenzo Bianconi wrote:
> > Defragmented MPDUs that are re-injected into the REO are mapped with
> > DMA_TO_DEVICE, but all the Rx reap and teardown paths unmap them with
> > DMA_FROM_DEVICE. The DMA API requires the unmap direction to match the
> > map direction, so this violates the contract.
> >=20
> > The mapping actually spans both directions, since the host has written
> > the buffer before the REO reads it and the buffer is read back by the
> > host afterwards, so DMA_BIDIRECTIONAL is the correct choice.
> >=20
> > Add a common ath12k_dp_unmap_rx_buf() helper that selects
> > DMA_BIDIRECTIONAL for re-injected buffers, identified by the existing
> > ath12k_skb_rxcb::is_frag flag, and DMA_FROM_DEVICE otherwise, then use =
it
> > in all the Rx reap and cleanup paths. Map and unmap the re-injected buf=
fer
> > with DMA_BIDIRECTIONAL consistently.
> >=20
> > Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0=
_SILICONZ_UPSTREAM-3
> >=20
> > Fixes: 33322e3ef074 ("wifi: ath12k: change DMA direction while mapping =
reinjected packets")
> > Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
> > ---
> > Changes in v3:
> > - Set ATH12K_SKB_RXCB()->paddr before err_unmap_dma condition in
> >   ath12k_wifi7_dp_rx_h_defrag_reo_reinject().
> > - Link to v2: https://lore.kernel.org/r/20261023-ath12k-fix-dma-mapping=
-for-reinject-packets-v2-1-9f436a26dd72@oss.qualcomm.com
> >=20
> > Changes in v2:
> > - Rely on ath12k_skb_rxcb is_frag field and drop reinjected one.
> > - Link to v1: https://lore.kernel.org/r/20261017-ath12k-fix-dma-mapping=
-for-reinject-packets-v1-1-b94860e18ba4@oss.qualcomm.com
> > ---
> >  drivers/net/wireless/ath/ath12k/dp.c           |  6 ++---
> >  drivers/net/wireless/ath/ath12k/dp_mon.c       |  5 ++--
> >  drivers/net/wireless/ath/ath12k/dp_rx.c        |  3 +--
> >  drivers/net/wireless/ath/ath12k/dp_rx.h        | 11 ++++++++
> >  drivers/net/wireless/ath/ath12k/wifi7/dp_mon.c | 17 +++---------
> >  drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c  | 37 ++++++++----------=
--------
> >  6 files changed, 31 insertions(+), 48 deletions(-)
> This conflicts with recently added:
> febe1f8cbccc ("wifi: ath12k: avoid double DMA unmap of held monitor RX bu=
ffers")
>=20
> Please rebase.

ack, I will fix it in v4. Thanks.

Regards,
Lorenzo

>=20
> /jeff

--TFQXiE9/RmqGVScH
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCavl0KAAKCRA6cBh0uS2t
rDfIAP9LsvchkosseFMCCklR+xp+xLpkmVThJzdpJWr4FgvdMwD/e43bZ8MnuxjP
p0Z+P8Aes18g9Ty6PaAfn4ql5WDFFQ4=
=RQOP
-----END PGP SIGNATURE-----

--TFQXiE9/RmqGVScH--
