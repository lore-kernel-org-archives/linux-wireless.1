Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794842754;
	b=pljm/gyFXRLXNYmUqJy7+PZhlioPklfE4s2xfBW3ulm996W37fKtsWLp5ce3PqXRvHvc
	 NlJI1VhlNBxj65xH+p7if1yy2qGBZQnC/Y8PEFJTQR/n3+7c3LYDvrKLR0v/34dYDCaVj
	 33ucirZr//rpwia8RPzPV1/MYuMiK1Zyh5lesBxdjYGti+4MfYocessXQLETUEY+a5LIb
	 hJ5fP/Bm0jhPSdhIUdmpnodcdyCnnKte6H4DvHf1apIzlzu4viK/w2TApYSZfbp9JssPa
	 Ws/Bfhq6rIVZHS/G64OEhMH2fqTfH7T+4u8Uf+15OXGQB2Ye+hWwt4HOE0gQhXjE+AQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794842754;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=OCi0EFeQTWCwCeRewkBP9kQwiHR/Y8Onl1tBxX1t6Qc=;
	b=3GkNFwmyBbHy0e43Drk3oOHKBRXhK5y4A7mbnW/zJP+BiTfZo4oZU+SIrHJMR20guhgS
	 XENWwYWaLD67XDZgJoydL46Kv5V9rHsM9pW3wvDfpeBCmJXf7lohRluzcWT8X2j6Uq0KS
	 QcSH2H2ggDD90NMiIfNXD571mIFYGLcMgdtpk/RjfNjjts/T1BP6hMaJg63cbf+dxEacH
	 rj8EoDtUOHYMtxWCg30pna33NiURYkABIccyv+a22axYSrnLDi5bMO7XPimDqp5ptSA+d
	 gtKPsarGs8gWYTr3VjPZ32CkoaneML+GB4jc+I6wd6KeqApGxyrFccBWX/Rs38Y/MDQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dbUtLH7O;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LNWYabXR;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33C59606A898
	for <linux-wireless@vger.kernel.org>; Mon, 16 Nov 2026 15:25:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 33C59606A898
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dbUtLH7O;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LNWYabXR
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AGDrSkJ1727180
	for <linux-wireless@vger.kernel.org>; Mon, 16 Nov 2026 15:25:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OCi0EFeQTWCwCeRewkBP9kQwiHR/Y8Onl1tBxX1t6Qc=; b=dbUtLH7ODDImv+Bw
	dAblIO9ciBFvJM01OilRUZIJwj70ECzP4mQgRv8DE8gw0HL7dce33Uh1HvO3bmyT
	oLF06MErMam++wMysOBBuKiQC11f4tx7TdWY7uEIdUd0eMgT2uOc5ScpCvc83GkG
	w76XSAXFTEJzj+MD/MyHWe02QkLQiahz3fMTM+CRbEy6ifV7GHp6syBng4AwrXwG
	PjuXitasCYy1OPk7e1bfUTPHP1N6VboMyxRdUPeBaAMCMqydw+QN2KcMwSXB3yDM
	k5az4nruvYU/NIY8WNVVeYt06VYHcaMNoszsKlfqEt4CuV4ShuXiD6RGMf80ZJn8
	fu5meQ==
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hyyrqh514-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Mon, 16 Nov 2026 15:25:53 +0000 (GMT)
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4c734afb8deso4135671b6e.1
        for <linux-wireless@vger.kernel.org>; Mon, 16 Nov 2026 07:25:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794842752; cv=none;
        d=google.com; s=arc-20260327;
        b=ntR/2/H9ExEEggDo1B4E9m18NMLP5UQTHpXaYxL3/JGiv3lMhYI0rj/9ZIo/cxLHvm
         6Uy4x2XQksf2WG5yxHVIkfA5NsFc6YHrLC9z4FQbUdoprgl1SSggsdmBLl5u5s9PzRCP
         nSq2KCFrGpbF+e6pF0MXHEfXpPGLhMDd5C5mvVn8OeJ5bhNXajIO7ND0OmkDJDpgQTiv
         ikWGmexnIqSQxZ6YSfnxnBiT6pXrGIZGiTRJcVRRDF0hHEfwMTg41RRNNb0NE4QMkUt6
         dDm+q8QbzPqhWVvcRbqVX99HsUVnkCjQowsZ/DVYNavJ3y1pc0lznr7MlJBwYf0KpCz+
         vsng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OCi0EFeQTWCwCeRewkBP9kQwiHR/Y8Onl1tBxX1t6Qc=;
        fh=mPOPZwytEKN8xT04Mans3T8wZVxq+GiWsq70wma2Pyc=;
        b=Be6ACsdIuirFEopwRMGHuORdHfoo2w4nJ2G/dgn43wUMs6bIcF/v+LaFRUd9iC+xAQ
         +TGwHVzkZCeRJCMG7dKEejQrbhIvbHni7vkf+/yTzmi3j/qgHCXMCegew950ddBrvwz9
         yjIoA4JaB3k/SJKuOOdoCk7160B3BD8FpJGg9E4VCfZWwKefVzVnxk+bvt7hbFuR5dUg
         eq6g90PH4cz+TgS+YTrkZfKEjS3rS5Hhln+cy6l/KI44JsHQW0tDBPGhBsznPFeWqQzx
         w1+7agmdzdvR5JC6zuWzpRrvvv6s4UXW4mWo+6GgdRzzoOTK9+mUS3HubdBYPiFvJlHV
         zXjA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794842752; x=1795447552; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OCi0EFeQTWCwCeRewkBP9kQwiHR/Y8Onl1tBxX1t6Qc=;
        b=LNWYabXRntwzQQnfsr8K8YWSzLvBYzaO3PElXVwpiE4oyaxbbl42TAJZduKlpxI1/7
         2uq291VW+utK9VE1duAZS5IZfzNnVSxKScyIeLc9LQ9i2gcpPE2shh8L8j40cdI678Fz
         Mkv6BImeU0SIPCCpUDK7YXOkfQeQUJ7wa6xHqBOnJI6LMpJcXI+fF2HmCaCJLNvd8SR2
         IJ0UDc1RgYH2mivj2Yr+U66cH2Cu+wHvxVopL/MtJFK8Dj7g2vncwKf3q4ksXuEh3Va2
         M4dPi6aAs0opBdNebsPKbnEefQgXzAkTFWcUHCV7XBo9zffykBRy3bAiK4hCgnSUk42d
         /LIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794842752; x=1795447552;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OCi0EFeQTWCwCeRewkBP9kQwiHR/Y8Onl1tBxX1t6Qc=;
        b=StEfZEAJGXmIBrkCl9wUDw9mf4CQ/cFAOf+UwD7W1Ol6NcjgUWS/uCqFl0RjTqbinw
         HhJAR28ayD52LxjLn1SEKeiLplB2DCZVhe4toMVGOIGCs4sfUvlho0g4yqLwFcXdN2XI
         HuksYz47pvXN5IVlQPi9VmuBCYoPAowHIUF/9Dr2g6TNscHurUnioYtVcpe5rxvoDvxi
         PO2s/vjZ5wbgrQXWjljamNhivvc1MWNINDRWtdF42cSR8iEY3v+n8Dw8iRoaJ0ltGk5o
         eciJjcuParRtwhAhwL6KQZiAH/dDNz09REgSw5WnpulMm+DFbWepGkIxuzgg6y0/x01q
         DPKA==
X-Forwarded-Encrypted: i=1; AL+hErH3v6V/zou5g1rHCqiXdCwiAzStvVoblstS0scBvKuicVEOsA4WzjThtPwOhH4WO74+Nhx7SVwNuAql4ueKGg==@vger.kernel.org
X-Gm-Message-State: APuU4Z8jgfFF172aqLlYGUI1FlgINzZP3ahwcQRJvd/84hG1bmw5RGw+
	AuqTL5rFb8O5zZa5+5hTAw5f71l0EBezRxJABtrDct06NuZjHV49pYo5Bx0NkgmRzTYPmN71zM4
	dBY1Q13VCCfEQKj63bIqyxh/ZF96vW25GyEExcxVmStWaoagxd39xaW9QeXL2JaCxQFweya7tD1
	Hg7xXXLD8jLbjAP/a2HR2hjcBbHamTdiviJD4y/PaaUDCm
X-Gm-Gg: AYBFou3Hic4WNuWnsbWOdkLU7Ni+4FtmXaoTinsUaQRL60RX3IoQLnF9W05Be44EqpY
	d4+L0F+bP0VKUKhE/Av9W5kC/uuC8f9V8fMX4SGuOfhUiDP6B9HnfvcZv4zLNTfDXbK4sLS+031
	tCSnmj1MmYwIlG0EZkI1So35V6EryT6IJEKMmBVgBDcgd2wnzbHsbKOLWCuBdaCecSiqnDrft+C
	zFmZ87X8cua3PBDSTs65ZkOtsYJ6uPgfPxS1y7utseb2Yva6MWvsZt0/bDZR5tW9PeOkpPqi6o=
X-Received: by 2002:a05:6808:4f4f:b0:573:4e8b:1f5c with SMTP id 5614622812f47-5734e8b3fb1mr5344816b6e.35.1794842752540;
        Mon, 16 Nov 2026 07:25:52 -0800 (PST)
X-Received: by 2002:a05:6808:4f4f:b0:573:4e8b:1f5c with SMTP id
 5614622812f47-5734e8b3fb1mr5344784b6e.35.1794842752120; Mon, 16 Nov 2026
 07:25:52 -0800 (PST)
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261101164247.258200-1-julius@bairaktaris.de>
 <CAFEp6-3iq_Pc0UgeCi7x16w6J-VwgGQ37QaP=dXp_OaTEi+esg@mail.gmail.com> <20261114210506.787342-1-julius@bairaktaris.de>
In-Reply-To: <20261114210506.787342-1-julius@bairaktaris.de>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 16 Nov 2026 16:25:41 +0100
X-Gm-Features: AclHuK99qyYiTBn1w_wsKGa0k7udgWCX78Nskst2jWzL_EErZ3zuCac4Z_wS87c
Message-ID: <CAFEp6-0nEWKrKXx0A7dHuzFU_=NZfzjNZQzKp2nfk+gr_SDvag@mail.gmail.com>
Subject: Re: [PATCH ath-next] wifi: ath10k: spread the PCI copy engine
 interrupts over the CPUs
To: Julius Bairaktaris <julius@bairaktaris.de>
Cc: jjohnson@kernel.org, ath10k@lists.infradead.org,
        linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
        baochen.qiang@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=VcJir1p9 c=1 sm=1 tr=0 ts=6afb2081 cx=c_pps
 a=WJcna6AvsNCxL/DJwPP1KA==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=EBsIc212XWC_7v4aTzkA:9 a=QEXdDO2ut3YA:10
 a=_Y9Zt4tPzoBS9L09Snn2:22
X-Proofpoint-ORIG-GUID: 23zd7zxr4hFJeAgBjw1r7gRvcno9AC92
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA2MSBTYWx0ZWRfXzJ2F6UViRbY5
 ShYA/gwYDwSrcBABgi4yI3SbTf6WBIDnSCnfNxy7bF6G/jwxWX0iKJZRxndKgbcqkz+jPedn0JO
 yJcdI5lWRbTF9ojOL/ExEoAAHwBib7wiuuLIjpdhRqDbCG0veJ5iBSlXKuhmLo6inC9JT+l1ZTi
 xe8nHpPdn9z7bwGQL1QDw9i+Ryxfng45VyYhNoKG5qx9xNXdRVCK9bwP2sjXa956rfVEN6OesS3
 dX8OeFaPW8YFioI8K03fxcQezC/b8zSw0dnB+1TKq6g2ePqcuh2tuI8ZswAfzh5BepXQQ++9+IG
 v4wfRRRp5o634IhVpqQhgYoDKAtFLll43Bf8AcwUTzmuO4rysMLmsGu2rV8KkhkcEDFHwE/3y3s
 zLJnBge4SOWsGggbkuYipk3JM0d9BeF5cF7fWrLrVVtXJsQBk1C6IyCiQI9gTI+AVNrPXtIvjGq
 DHz+HC5wmiE2SflP4WA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA2MSBTYWx0ZWRfXwPqPdm03dpGu
 6HXFWlilmYftDMqZF38sUmSEtDyuFZwHoOqz4pxgoRdTFuKiAZPgTGYSuiSojvfJ7ExovGHKlCs
 mro4xI8c/AHu3722dRqHmRI8FlM6gwQ=
X-Proofpoint-GUID: 23zd7zxr4hFJeAgBjw1r7gRvcno9AC92
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_04,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 bulkscore=0 phishscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160061

On Sat, Nov 14, 2026 at 10:05=E2=80=AFPM Julius Bairaktaris
<julius@bairaktaris.de> wrote:
>
> On Mon, Nov 2, 2026 at 1:13 PM Loic Poulain wrote:
> > > -           ret =3D pci_enable_msi(ar_pci->pdev);
> > > -           if (ret =3D=3D 0)
> > > +           ret =3D pci_alloc_irq_vectors(ar_pci->pdev, 1, CE_COUNT_M=
AX + 1,
> > > +                                       PCI_IRQ_MSI);
> >
> > Why not simply using pci_alloc_irq_vectors_affinity()?
>
> irq_calc_affinity_vectors() sizes the block by the possible CPUs: 5
> vectors on the 4-CPU IPQ8074 with the firmware vector as pre_vector.
> msi_setup_msi_desc() rounds that up and enables 8 in the device, so the
> HTT copy engine's vector 6 has no handler: 226 interrupts in 14 s (one
> run) against 36891-37590 with the hints (three runs). A calc_sets
> callback allocates all 8, but group_cpus_evenly() makes at most one
> group per CPU and the rest get irq_default_affinity. v2 takes the whole
> block or one vector, and keeps the hints.

So, from what you say I understand pci_alloc_irq_vectors_affinity() is
the wrong API here because it sizes the allocation around CPUs,
whereas your goal is to size the allocation around device
CE/capability (8 vectors).

Can you mention cfe9011a05a8 ("ath10k: remove MSI range support").
And why we re-introduce MIS support and how is it different from
previous implementation?

Also, you should update the comment/kdoc for
ath10k_pci_per_engine_handler() which says MSI interrupts are not
handled there.

Regards,
Loic
