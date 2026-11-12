Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794502167;
	b=LeL65/b7phoB3uurRm0bxua5ozMIbheUS2I9opybn1QGSaIobRv1r/6lUWYsDSeGNB1a
	 fh+bm5wylLbStpYoBVsDwsj2IgkQECA8FM0iybUmW9GqK/eXu38fwRtgZeHYL6J25msjJ
	 rhznAyjgu+r/SrQJ1mg2enCokftT8mPM7VNNdksr3NY9Qdu3xSL3yXMbbfUfRgMM90+Kf
	 XAO/CTYkk/Mh1ikPmkxnNKi+GtpBT5sMqIicDe/baIJWHt80wFEs/TOpyhY3ASiSs/t9K
	 dXYSD4VzNiPswBtkYeIlfb2zrFVBvlOPzxbkILYk6yVmAtzOH+zEcbloNLa9ahhEEXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794502167;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 In-Reply-To:References:Subject:Message-Id:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Mailer:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=FsrS7ZAKV95I17yNbcgQPjCjXYkWTNP9phg2HLAD6MY=;
	b=RNVbJztSDO/JE8SoWg1wRELvq4j4E7L2ELNibeOagX5JkFkG7yLWdSVwXagp9fuB7vZO
	 DYtN0XNfsDt7inkaq5vCrvxvqU0hXSEosgK2+eflLpp5JWYz3K5iV+Zt23x2mEFfqGFK4
	 KzkIYZ52pqyYV5EQUzyHw9RsLZ2t1LOCXRx7RokKzLP37rKe829sMALJs/G6SWWrOo2rV
	 WMIpS475k3SDIrD55cUumm55vDOJqlbh4pxmRUVMJx/yW43/3dZY6xiROmNWlLWrYDFqV
	 j8FModpla119zqlmDrBdqah+h1BgvbMYCbcNZQijh6aZI/87uixlgEeP6ldLIQTE/Ww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Vk7tVejQ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FiVTxlER;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D597606A323
	for <linux-wireless@vger.kernel.org>; Thu, 12 Nov 2026 16:49:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7D597606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Vk7tVejQ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FiVTxlER
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ACFZViB1736574
	for <linux-wireless@vger.kernel.org>; Thu, 12 Nov 2026 16:49:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FsrS7ZAKV95I17yNbcgQPjCjXYkWTNP9phg2HLAD6MY=; b=Vk7tVejQY2qmJmKT
	u7FPB0+6lQXGCVm+EcQ22A94OwNx4mIXU4h68v6AP9NA1Du9N7hSK2yf6iNUmg6D
	DEGmWtCP2fHVtq9xJ7nrwuhpAsn9jfOsX5Y29Awb2ca+WBFEcNwszL763JYIWgFG
	MaL2EFlsE65ZbpSbfoPMORohiYA5fNJdPMAxXAQOjBs57q883G4Re2z1VUUNJ1Lz
	KPNLuK1shOW07zJLZnOvRnYZRJ3eB2ibp+HgcCC8nmiOGEDPvlQlhyoa5WKzwBD0
	vPnlNEGe9SoYMF3JJoJ/ywCbEB52XLO/sf4kw5c2sPB5b0vFJ68zOcEkLKN/6PIK
	FSub0w==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hw7nc2e8d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Thu, 12 Nov 2026 16:49:26 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-36a3451ea93so47284eec.1
        for <linux-wireless@vger.kernel.org>; Thu, 12 Nov 2026 08:49:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794502166; x=1795106966; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FsrS7ZAKV95I17yNbcgQPjCjXYkWTNP9phg2HLAD6MY=;
        b=FiVTxlERppxuKxlZJadbQZTeVyaBvEmTrEVB/brQmzT06tOL1Y2R471W9vesVXfynS
         zV1lsS8DNl40GP8+Dqa7EMU3qViMjVWs5p5CcVBx6/tbTZZSVw9awnJqyQdUMbeoWsqO
         dDNzEImK+TSzZuqppb7ZIRyM+OnR2kyry3wyooqOGOIVW0n7DLoM2eXttluxeYgLhyLm
         19ZHQiWelwE9p45jWkoKvF1R3VRxlceNzwDt9u7BAvHk3bTGvL9qtUFKW20FDtAspaDl
         n9g3O1v+3A+NLXa7nFL6BM1CjWaLTCg7kt5h0y4GhFLRcwiauHrH95aBOkxUJR/kunX6
         xRyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794502166; x=1795106966;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FsrS7ZAKV95I17yNbcgQPjCjXYkWTNP9phg2HLAD6MY=;
        b=Q4mogYFXAaCHt3Pc0xTqoVrP/q4uFDMex1mmPUidRCPfRLy/Zb63wZ6QIaiPpoqO4J
         Y4pgoRt79zgvV3wsy9orD/ciTTWWNyrkDXUCsOhJr+yOug9cShwepxvCXZyOqN24sa7I
         n0/c4ktI3IMenclADWrkqpWZdrD3H1Rbc68+G8F7KucUiov8cbRrD6+5JmuRPil1KHXt
         HBvn0jbF9u1gZL849Nt8TAeAVSP7Rpicn6c9UkEKc9qnPptazqnw0ajs0KjHTq9yYaTS
         D/xP1dXZo1UWLr+hIKPhs8ToFnLMlAF+GAtSr09s3X/yyJ5Zqf/d2irmfdnm+ygXg10U
         Ppmg==
X-Forwarded-Encrypted: i=1; AL+hErFKviv2COiMMibu/uzh4HRuDPO5rgLpBZ3MWKDofqNJ/klW0TfzKwYtB9b1Z3m4/A4hfd75j5NIYbzWiv5o+A==@vger.kernel.org
X-Gm-Message-State: APuU4Z9f7Ni0zk7p45JMU1V6qdMAkvdITVER7+7KVBzYvIHZIH9xl7qC
	Gm3+ihLxEUVv3h1qXnJtZQyzY941JnZtIswOMsTsIfvgFRdK/PKlYIuHcoEalZImbxHH7FoI+9m
	QLQ+g6pIYt7SerkbH8qY2bSzcxrCcMUk+CFXC2GkzN5z+J/BngoG07i5SD1jmE6+NBXSdFg==
X-Gm-Gg: AYBFou2HK9KjEAjsjDECDv4xB23D3KCcKee/lrpWRgjO/661t7GvWesWJ9w9YJGw8sD
	2fpVavqdQtC+QKwsEEqPNC7cl52HDS4FcjfDtC9LVFs/7fRh30rDmQMu4DIghWRW5K0F6grFt+Y
	REEk6zqCVIZsrzs8NWHGhOd7t0hzCn0mEQVOoQzo0o6N7SKpo3HKeJ4IkhlA+XQ72SP8VwYrazd
	bjuVGZifV5ZHv4XnnvGh2502IOr1baRSUu7tEsQT4VHleVImlPBLociccFC67IF7IhUW5fUa/bD
	gIpdXjp7HaqpaMEdIZzF1TpYe1MveqL7V7EZph4Qtl/YL+zNVlDVHlamGSnncLRA4f4mVjni1nr
	ZezUpGuNtdDcoIXtrP+FzgDE3b0Vb0RZCf7ON5c542ufzrFNcLL9REErmaX/6ghQ85Pqr18HcKn
	Ei4c2/nzIrwABGYdOxzXJ3Oq/sPVc=
X-Received: by 2002:a05:7301:508e:b0:36a:1f8:a589 with SMTP id 5a478bee46e88-37686173309mr6512782eec.27.1794502165632;
        Thu, 12 Nov 2026 08:49:25 -0800 (PST)
X-Received: by 2002:a05:7301:508e:b0:36a:1f8:a589 with SMTP id 5a478bee46e88-37686173309mr6512748eec.27.1794502164967;
        Thu, 12 Nov 2026 08:49:24 -0800 (PST)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37924f90f16sm850570eec.7.2026.11.12.08.49.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 08:49:24 -0800 (PST)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>, Arnd Bergmann <arnd@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, P Praneesh <quic_ppranees@quicinc.com>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>,
        Johan Hovold <johan+linaro@kernel.org>,
        Balamurugan S <quic_bselvara@quicinc.com>,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
In-Reply-To: <20260313094852.3716715-1-arnd@kernel.org>
References: <20260313094852.3716715-1-arnd@kernel.org>
Subject: Re: [PATCH] wifi: ath12k: fix QCOM_RPROC_COMMON dependency
Message-Id: <179450216411.3069467.7160661678626083545.b4-ty@b4>
Date: Thu, 12 Nov 2026 08:49:24 -0800
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
X-Mailer: b4 0.16.0
X-Proofpoint-ORIG-GUID: y8bmg6OFrNcgz-pMsDM2MPFD9DdYPFmv
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA2NiBTYWx0ZWRfX4ZBPnVCMUtqI
 Fm8oeycLtfDRV+hV2poE2o3LluaupqOxnCQuudFnpcWR8zSLbkKQZR2/q/UHzPFxawKm5FM+G7I
 23VqxYNI/uvgkmrJNgJ/rmQC7AnX4xA=
X-Proofpoint-GUID: y8bmg6OFrNcgz-pMsDM2MPFD9DdYPFmv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA2NiBTYWx0ZWRfXx1ORuJXQwFKn
 AUphJNt6RACTgwNd0CiYoZMdvJm65SIQWjosmkaJbmZmBihBOamkUdyaKULMf8iqjmpgaAeiMq7
 xHwo2YczpaxDEw+cW6OxZHWu7mm25MZrfQN9Fd8jVQim/sY1Y6m5Gguzeclz8O5JvTquWDNmjrz
 lBXJV4S3u7qFyCBhzj0n/Z7S6njlCOPRNrH6PKDgkHERyyc+6RcjqHuruE0rfKt/NptM2sGI5cA
 /41L+xf2PjtI5JlYiXPPzp7jb3OKmnrq7t5wgOSCGlIlW5s5gbrORvgxHE/Al/CwGVOPZKJOX4d
 1naE7TFuUR0zuRLSq6T2+kV/6eCiGHjU8oHRkr9T9dM6w9pXbNRUMzkQHrijUOkinzfTzphA7Az
 JBcgV0Nombg4hdH+IS9JxoldNJnj/ogogxlQpLXL0qGPw+jttevrZt2J7Fcu1W8sOWJyL8u0J/y
 sINMXKMhM5yyydQ/FfA==
X-Authority-Analysis: v=2.4 cv=A8b5rKWG c=1 sm=1 tr=0 ts=6af5ee16 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=R66U1AtMWxEI_q0A12oA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 spamscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120066


On Fri, 13 Mar 2026 10:48:43 +0100, Arnd Bergmann wrote:
> The AHB driver depends on the remoteproc interface, which could
> be in a loadable module when ath12k itself is built-in:
> 
> arm-linux-gnueabi-ld: drivers/net/wireless/ath/ath12k/ahb.o: in function `ath12k_ahb_probe':
> ahb.c:(.text+0xb2c): undefined reference to `qcom_register_ssr_notifier'
> arm-linux-gnueabi-ld: ahb.c:(.text+0x1000): undefined reference to `qcom_unregister_ssr_notifier'
> arm-linux-gnueabi-ld: drivers/net/wireless/ath/ath12k/ahb.o: in function `ath12k_ahb_remove':
> ahb.c:(.text+0x1146): undefined reference to `qcom_unregister_ssr_notifier'
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: fix QCOM_RPROC_COMMON dependency
      commit: f8534946346ef1d5a9899b933013d7438d6a0dc8

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>

