Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795132356;
	b=xPuTqekul9eMMQdzj1GMyycPOOqRt1SXfetdjSCLQ9ReV1pm0DblImmIEStUHTWJ5uTq
	 /pJYDD8UhX8rzhAzHOY+fNY1S8FmUwM8p7AejzprP+rdXv4mlMw01IAB+lqBmeiGlnU/g
	 9ot9jl0ysZIdmKMG4VxyZfxA6GyvGi7aa2+7DAn0nvyX1aZzH9t9dIsUDSZHzaUMN9S5F
	 Ir897OSIu2yXPsWMRVmwVGxiKcZPeEkvScGvPXOIgI4gJw512sz8TyksqVDRY0V3nfJHk
	 OnOskGTU5WxbtBDvbHAy5I3SW/7l3gz+EuUuSVFGx0BXe5DlijVBZDWnENGba6CwWBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795132356;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ywdLYv7XjTS09LFKQvuVk3pTXGox0hEDPrVdY2rJ4es=;
	b=AMGKg1Qmm2vpwQK1b8/aFKHAy+IKuG5CudVekHz446Q6liiUVkyh3+plGspX+dqRbpOn
	 wVqgn9nXjXZjaovu8Pk6vFBQbnfQQXpy0mrrZXTg5DBDvXypBBDJbsGTNWuzG1uQBzoPw
	 ErarwwcezUVseG6Ot7C4dxILT8uys4fZx/r66ROYCG80tf117+OHn67sEelMsYK0KXLKa
	 KBdrEsALKPMSDWe64/FOx9iBCGPzxn1OJbphJYd5uW2CAAumtDpAY5czlfMI3SlfnGRIM
	 KnQxAkj6QM4PoySthkJ4RS/w3Of4DWpWOEI34rzNFUQRNsJziNU3r1XDVif5yexNzLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZTnKvAW+;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Y+M6w1d8;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA64C606A320
	for <linux-wireless@vger.kernel.org>; Thu, 19 Nov 2026 23:52:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CA64C606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZTnKvAW+;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Y+M6w1d8
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJJTrod1111871
	for <linux-wireless@vger.kernel.org>; Thu, 19 Nov 2026 23:52:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ywdLYv7XjTS
	09LFKQvuVk3pTXGox0hEDPrVdY2rJ4es=; b=ZTnKvAW+zAiAMcdhUxE9mL6AgME
	bxxquOgyeK4YFIzCo/fLR2rpTzpnbYJXwEx3wcyPeD3B76Lev9BRw9f/7xwr49pw
	H4NI3StjZOSUUvu/9/+eLBUULAtxgyM3ddCjR88jNAaNiRNK2fB12fL0Hoz/Ubyb
	st54ls157qLuE8NNG4Qgz/V6tUoFEL4KlKP6GJMM0rCJs55f11ywbS6mJGt/Adw5
	0lQHYe0Nx04sWtg9eqCReX/vNvUDyIG1+TiARlSO5bozoUjEF3yzDxfKXA2Xnu+h
	EmAMgK+2lMd+quWkHRp1E2eV9u2ew41J1WexgFPe4+KDSNToM5yoQwtOB8A==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j27au0yqu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Thu, 19 Nov 2026 23:52:34 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-38355b03cb8so241908eec.0
        for <linux-wireless@vger.kernel.org>; Thu, 19 Nov 2026 15:52:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795132353; x=1795737153; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ywdLYv7XjTS09LFKQvuVk3pTXGox0hEDPrVdY2rJ4es=;
        b=Y+M6w1d8/Y4TUn51nz68U8HpPH3EEZ6X1s+G2LKPIywgW9r0DCFMwmAnKAdU8jFo+a
         rsnke5tJjtuNL6LiGKu2J4bdV7DbsqBLou27PDWAUunkyxR4/88q2e2+yZBCG3n7PVsZ
         zWWuMg9gD0siOXx8NSEIGw7ysSwBgwomD5hQoYEMsu/Tkabci+5C76tTa1Np6BoAu72q
         si+gLuy/ONK/BGXqUgs8v6QYHtyw09hFxm2Y1B8W+GU3rokO+sNHPe/ZH3nfopDnJHHt
         NwC1IWU/zYnCQeiBkFRGF9vQZ2rGqZf9jrdHRil1gLCMkNxoHcm8hVontGuNhnLOKddH
         q4Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795132353; x=1795737153;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ywdLYv7XjTS09LFKQvuVk3pTXGox0hEDPrVdY2rJ4es=;
        b=whCcaqxaqhInfNdJfa06Br7TEOcgb6UuoZGPcK8KICeK6SrUWax+ZJesmbCRaaMr6a
         vFYsr6PiudU7t4LzkwUesAJqAbPvn8TWPWVQJA20OKDok9H3nrk28wntcM4re1iJaUM4
         //RWqDjwsu4doBgyRIQfIRG1/e6NvUxiAfkXkE5+gQnVoUb9YClTR+B0zQpbRxUILIUL
         8oOuj3+heHLRzGdSncAhHZrkiTKs4lUd6IB1/SRrXvX5Z/lTD59FdS2GqEl9wugRQKGl
         XL+M44i9irBp0WSJFYSrg/DlVyr1U6XOA9Ba3YPqyIO8ie7LOXQ7OzurrCqwJeWCiytb
         pFtg==
X-Forwarded-Encrypted: i=1; AL+hErEXi65OzNEFIXHNPCUUv1NC/Gqgu7I7D4zVYegM1LfON7ptnN4UV4KbsYS4TQydOTmxFp5UwtoAvGfYdgxoHw==@vger.kernel.org
X-Gm-Message-State: APuU4Z9cmjyv+Sc0J2BRo+oP0P+Ehe8H302wrhRLDMaTmdY6Uyd3EEbT
	pUAMdzyJKSIiKr5ie+cbW9Dgsmy1ZiazrEMGDvDSHQUj2AgVsKKeLQPkSpPJGeW1pcJ1+rT7P6T
	4mTRLV6ZYuLwPS74TfHDMK95hPDCaTSHL76j9ywcK8KpkhJsf7P+5OFAhsAaaEnb/nVUQ3zDaFW
	pmFQ==
X-Gm-Gg: AZFdTZcJJ4yzWBfZrKxi5z/6v8dimZwlItuTldAbCdb5Bd3Hpb3z/6QP6Jk2/gm6yhG
	6HZFLCgf9iBA9+ZaxjEoN2nmDki2DG/X/6fdyRIQPHSk5+BZNFblNND1uC8y1zdY149eTrRupiD
	UdOTezE+YZUGEzy3XZMjGFkrUin2PGJjoTCt6YDsVS5oQl9OyFFnzsIGmVIFyWGm8ojL1vs2F56
	X1DTwlDPpwwoY+KGBhIKEr9MZYho+GIiQwX40rNTbl4z6XVPG0r+uYhMlv58cYlP1hQVA7KM7v6
	i7kLwDVOYsuLc6M65045gTIEsQy+pWDodgBht4HeYjR1auaZaF3VvpNoIski0qgG6I1zq3xzvH/
	xGk3gxSAmURWZ7R5KnMDOaVUEEGTAsLIbD1l8GWOVl07S7c2+iwIX9vywNuEeRSrTJT4sgpTZjB
	FBSIAV9RM2t/jxCzY3M0eNsdhp5KU=
X-Received: by 2002:a05:7300:e9c5:20b0:381:f33d:ed9d with SMTP id 5a478bee46e88-3856fb6a214mr1067902eec.21.1795132353244;
        Thu, 19 Nov 2026 15:52:33 -0800 (PST)
X-Received: by 2002:a05:7300:e9c5:20b0:381:f33d:ed9d with SMTP id 5a478bee46e88-3856fb6a214mr1067876eec.21.1795132352543;
        Thu, 19 Nov 2026 15:52:32 -0800 (PST)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385616f0a3fsm2032315eec.0.2026.11.19.15.52.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 15:52:31 -0800 (PST)
From: jeff.johnson@oss.qualcomm.com
To: mantas@8devices.com
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
        jeff.johnson@oss.qualcomm.com
Subject: Re: [ath-next] wifi: ath12k: limit WMI_SCAN_CHAN_LIST_CMDID argument size
Date: Thu, 19 Nov 2026 15:52:30 -0800
Message-ID: <email-14010032-20261119@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250310-limit-wmi-chanlist-v1-1-8f0fb45459a7@8devices.com>
References: 
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDA5NiBTYWx0ZWRfX8PYi3x/SWpAp
 i61GARlnSxl5aspdRs44fIM7vRTuNLHmVOjMTcUVuPSUS3B3koX0YAA7EmDbxYFHJZ/1r3d/uXU
 ZnWhoPkAMtZqwC2yiVcElMB+j5TTecNtjE9KBKKOfM27PovtV/996Q4EhJABYyYojVbIKvmpuiM
 xxvsnyPTRDMJXnzAGbWzxxxfHJb48t2DchZB3I8pKhwGHq+2K0AQalFPWe3AUUqzwP0mFCVbaVc
 Qz/vdbJWIZCbCBacR9cRfGxXnAZlS80PJurm2W2D78Y97Gd319WjTaTUIfQ+9c48f+i6f2ri50j
 G0rZq5grlGJvAb6bRSjOuY6vrpYiFqGJoLPrIuEAb5vAXhGwnreJb+nROvIjt8eK1kntcV4DZ2U
 8gwsVYvvq1YStxAsI0hpUK+ACresQKm9enVycLFShJm2vht4VNWFPD5Zs2JB0vKySZiCN/9f3NY
 TQIgBlk2HpkUmXWqPZQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDA5NiBTYWx0ZWRfX5oGz2anGKJHk
 03EIAL9KgVk/V6ytq8lNdcKZ0oDp148XsSOp87XtjlFLmtU1luiMiNgvjoEIXdZOtbVKBG6au09
 gHeKkCLatCQsQvrCgi+bOCELzo8t4Wg=
X-Proofpoint-ORIG-GUID: EzMnULr23CAHY8gWWCqGK0IRJpmB7cc-
X-Proofpoint-GUID: EzMnULr23CAHY8gWWCqGK0IRJpmB7cc-
X-Authority-Analysis: v=2.4 cv=KuHYSmWN c=1 sm=1 tr=0 ts=6aff8bc2 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=u5w7P5qLusBq6V5lPPMA:9
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_05,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 spamscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611190096

This is an automated message.

I am cleaning up my patchwork backlog, and this ancient patch does not
apply on top of the current main branch of ath.git. If you still wish for
this to be considered, please submit a new version of the patch, rebased on
the current main branch.

/jeff
