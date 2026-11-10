Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794320431;
	b=N+8t0kCjfsGJbqTTugWWnJxuYVDK5HBrngsD+MAgleEHygor7Xyr7O0bAJuxYbV30tyZ
	 PawvMq5xc50E4Rfg5yhGB9KOB1CBLTKjaCzPCCXLSpvchTSsd6q9fhk7PE7RWwGE13Vtk
	 O9Q3PX8aOyE1jqGNi3ZwVOG1xMZvWr3elk1J+DU7NgK8+Bbch+rZp8nf1mW08OnQj1kDE
	 u4a19b95yPAtPiNYkwKXips0vJfu4x7LFMapC1W82HgJctVzkYlC65jYVBjZ9ZKpGITwC
	 OmdZbs6E6WksqE+9JKStcYqbVk6abngnGWvEiNOs3gCFeZretaFEVi7iDcgbhDkxRXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794320431;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Ck5XRRHP22m9X3iNZf5BjNhfI3aiyPXUvxV7zc6dD6Q=;
	b=mBaOmYqsBa2vM3Rm5oYeGKQpEbO7ihkMULYhJYfRfq11fRHutQfid6uO3aQi1713CzCz
	 FSwnhe01l4o9NAxWckiu2BaUFUiZrpRH5EGgOuvEiCW+N1L9dS26j7zwdcZ4IbVLspUCG
	 dCneFXTL47KaLRt+YpQB9V0z6uyaHFj2dXyEU61gIe09DuefeQKSgcqxoStzyXup7FKXV
	 B4pUJ5OFA0J6E237YLA62brnKb560f+W7izpC3yYipC9A5RGY+fisUnoqsYoeaFvk7BtP
	 sBS/6pK2yhmyXS641Qw4GA5p3iHbnGVrFDRP57vZuZlepEiz7/lEfqJQxQmw74JLeoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=l7XBpB57;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="SQufQ1k/";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A84D860A260A
	for <linux-wireless@vger.kernel.org>; Tue, 10 Nov 2026 14:20:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A84D860A260A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=l7XBpB57;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SQufQ1k/
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AAB9uV92253402
	for <linux-wireless@vger.kernel.org>; Tue, 10 Nov 2026 14:20:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ck5XRRHP22m9X3iNZf5BjNhfI3aiyPXUvxV7zc6dD6Q=; b=l7XBpB57foeSGerC
	m5xXsz9xfKW3IDra2zZuwsxdvJkaQ+sMPB3p8LCrhBZTcHvBCSCwRuaGMNY4MCEh
	NyeVGcW1zNS2v/CIMe1i+iuwtlC6KRZgc1a9+WDr+CeB7Aw6+xBkdi6tB8YN3Uhz
	8UsZStqrHjrDSMX3kSDwEVqZSQ2pjvPynMWFSW/vpRtXRMldcfC/wwVEtMjQ0VBR
	WpGANWEThWa5E1yEJguRtPxpNoRUuCUNeVDiUOFyFnsyNWXZoiIn3MO+tjXoB9vQ
	8Vt+wOJxBnrVmVJtiCDnzJRDahla2Dy92Lt95CkpEBRgpKEtZgRO2CfRizsfEdSv
	yTxC0w==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4huyw495ff-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Tue, 10 Nov 2026 14:20:29 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-9907539aff7so1518644241.2
        for <linux-wireless@vger.kernel.org>; Tue, 10 Nov 2026 06:20:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794320429; x=1794925229; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Ck5XRRHP22m9X3iNZf5BjNhfI3aiyPXUvxV7zc6dD6Q=;
        b=SQufQ1k/vqtFYIYhBBNozDJ16NuqRj4sTU+pN1B1GogsNWWHoHd+u8YlVJlQu7q/KA
         5FwWlxjGkk3dwuRTI3pMT/FyOGFRZbAGVPtzLc+cNvnDU/NAdDdyacxx+H68apFaZXo8
         c61FqIxrknJf8LYMzeQg8ZViJVaxjrR7uusIzoiOUauZYOljIuMK/VnmAWG+dWJKQ8RZ
         VNFXU+zkrhcwheHv6rD9OpWlhhcqNW8gMtUI9XRaqYiHvSxlmwrDyJH2iHDIropfywqi
         d9zjiI9zJy4sjuKcNSGRTCLfzNenEmxXmemMmDaYgfNUNVlHXKyMwBxq2vZf23GbioRH
         3HkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794320429; x=1794925229;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ck5XRRHP22m9X3iNZf5BjNhfI3aiyPXUvxV7zc6dD6Q=;
        b=ZDWUmXSUeQllMdMWDSnuQCMtpt42FkTllgmzAenSM14E7J1SbYyy+Bhamki9tfNWan
         VLtIBkV53Y0QIIVUJgvmO1o7R3b+vhvFKrTCQNQa9zULgB1rBH+aPEoJKj3cJHL2+as1
         /S7heXlo/0ZYiYP9qzh9+lLrp2cCoPxoQaAku2sYBNZ31E3/5ATofo44YyatjjZOuAlk
         mCd9/oZcxN51UxjBMR7ehL5/DDM3zpErxsQ/dL5mCmi8TuOegh2z87UAS/rj2ENEg+qX
         R6ZURjllkaMwH+OTcDhNLgzLUdYsbwg6qTN/wzMBpFffxJSqwhTPA3xxUd1o0UNWgwPu
         kk3Q==
X-Forwarded-Encrypted: i=1; AL+hErGseGRPuPQiSACIujWv8MM8z2GhpdvyiOdBVB6jkZc+rNC+GvJUXuJX93aXVY0J16LES/kMZ1dE/TjIT3NmKw==@vger.kernel.org
X-Gm-Message-State: APuU4Z89+F8N0kp1sqBHQ2sMcBMxdGEIfNAKCea2u2vPTTnP8QYVOBkx
	eF4H8VCip9xnMVyrI8rl1G7mgBgKxOxZ8CCoGBXF02maNCHmTWGGCmQ3OxxvkjCcC48Exj5YemE
	LX0tcbO3K/C5G8VeoIVXryIGCRncaFk5okGt9tNbWAt6ae+SiiOQalfg6Ij2EhTgJMC2Qag==
X-Gm-Gg: AYBFou3MWpjFD6ViM1fVN0KUkAtTl1EQSaHu56B1En+yIR5XZq39Kind9BF8fKS8okn
	U6Pkkl0Q8BcaYj2I+PjfverydSRtqNPEULqUFfGN2FkdMyWU1Y0Qwar0GnTzGqnsa/bzd7YlqHZ
	gGsZlRnbkQMBfAbJiC+8hiTldzOwlg3ams7aWbxEFubrDPKfZ+txRmeNlwJvVPkFhkcuViE8mgg
	XYO39RroUDpMsuzUMTCmJNsWqARTPmfdZ11khjSCpwO4AbBfxLsoAn/13XxaqUSt3Re//BYbkm3
	j39LJgi1jYWh82YXxhc+bfrDAgUbffcyRD9dawWp6nQOgw5l8mPExmfgBn02QElWtRZsKa65r4a
	XB1aZGOUg84HLTHJkQ7nNmerUPsudU2UkK39x3lSSR8lVtzgToNWG+ZZC/GVmpnfX8uf3ZttwlK
	zhei8u9rW/zLuV4w==
X-Received: by 2002:a05:6102:e14:b0:7cc:2cef:b330 with SMTP id ada2fe7eead31-7d301b90875mr1015846137.12.1794320428757;
        Tue, 10 Nov 2026 06:20:28 -0800 (PST)
X-Received: by 2002:a05:6102:e14:b0:7cc:2cef:b330 with SMTP id ada2fe7eead31-7d301b90875mr1015820137.12.1794320428242;
        Tue, 10 Nov 2026 06:20:28 -0800 (PST)
Received: from hu-yabdulra-ams.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498365ccbccsm5242319f8f.44.2026.11.10.06.20.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 06:20:26 -0800 (PST)
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH net-next v5 2/4] net: qrtr: Assign unique node id for
 MHI endpoints
From: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
        Simon Horman <horms@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Eric Dumazet <edumazet@kernel.org>, linux-arm-msm@vger.kernel.org,
        netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, Bjorn Andersson <andersson@kernel.org>,
        Chris Lew <christopher.lew@oss.qualcomm.com>,
        Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>,
        Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>,
        Juha-Matti Tilli <juha-matti.tilli@iki.fi>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20261104-qrtr-multi-ep-v5-2-4cdb2b4f1920@oss.qualcomm.com>
References: <20261104-qrtr-multi-ep-v5-0-4cdb2b4f1920@oss.qualcomm.com>
 <20261104-qrtr-multi-ep-v5-2-4cdb2b4f1920@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 15:20:23 +0100
Message-Id: <179432042357.601816.13272349217674070278.b4-review@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794320425; l=1427;
 i=youssef.abdulrahman@oss.qualcomm.com; s=20261110;
 h=from:subject:message-id; bh=pmxqB3moG63ZiXPlatXfrHmi22c4brr8zAmv5UPA8I8=;
 b=3VK4IzgRzDq5+i8kNkOpzL1wcBaSJdMg4/naLLQ7vN/3KPtJH+B1yfG8lIp5w3xiAoLLoYDt3
 ZVuSV7r+yx/CX6B9QgIG7xJ7bIfu+nOZyq4a/C/87nhN4u704Cmn9aw
X-Developer-Key: i=youssef.abdulrahman@oss.qualcomm.com; a=ed25519;
 pk=JsDnG9UOJiLmu4WZj456fEwZASBHFVClDZ4KZkiVFAI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA1NyBTYWx0ZWRfX0SUqT/Ep2/lb
 znNXbUnnbgCF04tquI4CI8YrRx2/RgU2o6NDqh+6JCtpROi/XVPmFYXD/0Sirb1KWDO1QCwYyB/
 xG60fZ0ZpXvA4d4Ntlm1OFzzv5H32eO1IoCU9dT4uTfmI7c2XgYuHS+JDdGskVyBTVbrUL1AJAY
 rvizIh2T5EsVl5mw8M7tvkde0JQyFIkhdZESvTZpG2KndB4r4feQ/EF3kt2we5JmEkcI0pvyRUF
 6yPWXadUR9CY/ezdLFFZIEQMv6trAuKbjyzSVMNvrOen2rtQclaAqB33q42jHgaJvpMiOU/uxxC
 Sx6JWXtTIQ1ECPaGTHN7lZsegoHJd2YxuIJeugPJG9I2ZtxkvCxLhuAXH9BlEQHd/ArzO2FGbTN
 NRWbn8ZMNpDV0vkMtDA5rrMjrluZWZisJsT58r5xogWKiNsN2HoVQyAx4HsU0a2Hl5erK4HXWlV
 lCm1d4PATrni4nSTrdQ==
X-Authority-Analysis: v=2.4 cv=Ee1d0/mC c=1 sm=1 tr=0 ts=6af3282d cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=51d02FP0LlRxlB9DzpEA:9 a=QEXdDO2ut3YA:10
 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA1NyBTYWx0ZWRfX4Ftfa6VfytGl
 bO9thxb/qqz5H1erBxwOP56Y0taGGbry0G8FVVo3C6NHPellpgCKUtYJkK8cYcujHnjqzxjKyG0
 EpT7Xgp9+LEF1G/lWomX2CteFfQBtAQ=
X-Proofpoint-GUID: encfrByYb9FJ_NH3CeNeOES0pjQGhI81
X-Proofpoint-ORIG-GUID: encfrByYb9FJ_NH3CeNeOES0pjQGhI81
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_04,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 suspectscore=0 clxscore=1015 adultscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100057

> diff --git a/net/qrtr/af_qrtr.c b/net/qrtr/af_qrtr.c
> index efa70b95f8a7..7a59ccf15490 100644
> --- a/net/qrtr/af_qrtr.c
> +++ b/net/qrtr/af_qrtr.c
> @@ -11,6 +11,7 @@
>  #include <linux/wait.h>
>  #include <linux/workqueue.h>
>  
> +#include <net/qrtr.h>
>  #include <net/sock.h>
>  
>  #include "qrtr.h"
> @@ -590,6 +591,12 @@ int qrtr_endpoint_post(struct qrtr_endpoint *ep, const void *data, size_t len)
>  	    cb->type != QRTR_TYPE_RESUME_TX)
>  		goto err;
>  
> +	/* Host assigned node ids are not supposed to overlap with
> +	 * remote node ids
> +	 */
> +	if (cb->src_node >= QRTR_NODE_HOST_BASE)
> +		goto err;
> +
This breaks the functionality for QAIC devices, and any V1 packet with
nid >= 0x10000, for two reasons:
 - V1 uses 32-bit node IDs
 - QAIC devices use hw_sernum as the node ID. I am yet to see a device
   with node ID < 0x10000
This causes "invalid ipcrouter packet" error logs to be printed when the
device is advertising its services to the host.
>  	skb_put_data(skb, data + hdrlen, size);
>  
>  	nid = cb->src_node;
> @@ -615,6 +622,8 @@ int qrtr_endpoint_post(struct qrtr_endpoint *ep, const void *data, size_t len)
>  		const struct qrtr_ctrl_pkt *pkt = data + hdrlen;
>  
>  		nid = le32_to_cpu(pkt->server.node);
> +		if (nid >= QRTR_NODE_HOST_BASE)
> +			goto err;
Same concern as above.

-- 
Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
