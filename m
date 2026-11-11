Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794412207;
	b=OT7XxGLojrJWywlGTtvs3yNS9tmqnK24aBKAUAfKfJyt971epx7b6LJGK9UadkT+tIFk
	 V3bLFbiwOGxyp01zsdlPCMtnNraxoBoMBSy8Vk5E7AlAnjUJy/jsKynszTIJ3AV3F8dYa
	 llW0wWHOXfoNTAqZuFddh9qtBMCUAEZbVD/ovFBO8ylqb5yco9flIYmyPIlWi+ae6S97U
	 3lXB2skiDRH91KBv0xsgA9rlWnU9Sqd++QrhnTtKIyTP5eexGtKekoKXJYoJulNK5YKUk
	 EFdTVIax88ugsa71p60DEw8gmVWzvTr2PckaF2Ntv32QXe0Z/hx+45nuivhDFvKh2jg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794412207;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:In-Reply-To:References:
	 Subject:Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=N8P34AsH1fiSX6jG6cafAhHs+En/eyF0au7U2Zb8KIg=;
	b=yLnwQ5u92WuS8G3Kv53s0htK5BbEfZwAiTbMPPIRkQIVEj6sPqSXN9W7IV3QnKuWNwkZ
	 UslFpAk6mWAVF5mGsGInDAad3whKZme7aW2yvYFrb4fSBKvOfsd3Y7hOCXQgmt5HCn6vi
	 SPg5Qbah1lWib7a57lBBAYUnKg0CR0lTc+O9C5iDyA6V6H65Scl9p1FTZCn7X76DxwB29
	 qaL758+TA7mEHgMr3UBm/ienzHBlQB4GYkQfLNsMihi9oUtYBcB53g5ovPnRl+Dlgarru
	 Yf5ObSaUiYudxDOLcoihqFUHcDF1lQdV2rNcvwtWQaUtPOx7AsoEhWGGyE3pHVdMqmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ciuq+rmA;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CzlVGSsW;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEED2606A882
	for <linux-wireless@vger.kernel.org>; Wed, 11 Nov 2026 15:50:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BEED2606A882
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ciuq+rmA;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CzlVGSsW
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABFP2Ou014221
	for <linux-wireless@vger.kernel.org>; Wed, 11 Nov 2026 15:50:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	N8P34AsH1fiSX6jG6cafAhHs+En/eyF0au7U2Zb8KIg=; b=Ciuq+rmA2IWrsGYq
	5EEfbmBQvrDy3le3DRCW8QM8HFVU5mWWotthtXORhW0LoDU2fg3GowkZQhJ4R0Ev
	zfI6XFs2qnVX6wfk09982o9sU78248iD5NLnMeJP81R4BAqz5ZmKxW7WEMzYowe2
	f6R7sNp5EprZTCRoj87TEsiP/m4rai5wBiM10Qszz99UT6GHldVxqn0gzTAlOA2C
	lkvFUcdvKUUUKb2i+65DDsw3Qopstz7Alj/PxkmcQG5u59eW9+s2gc1fhUunUP/N
	YrB7QHmQBJ8R+2fsa5EVAwfY1i8DrWk20QFk7GP3Va9DHIOD1ZM4pC8QEaoQPK3s
	DeaCYQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvtymr498-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Wed, 11 Nov 2026 15:50:05 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-341eff9e381so6661145eec.1
        for <linux-wireless@vger.kernel.org>; Wed, 11 Nov 2026 07:50:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794412205; x=1795017005; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N8P34AsH1fiSX6jG6cafAhHs+En/eyF0au7U2Zb8KIg=;
        b=CzlVGSsWUVsHsbBzfOPn3eVEKmwWOjhy4Y3yf7lmzRVWdKBArEccw/rQOLfEC1ppVs
         Jqhs+h/lJKL3WYLpU6i0kRJdf1jcLOra9F3MRNZLYpOApYm30STqLYj8Vsm/v4nSQcqX
         AYU5UUguqiZTtgEZc2J+S4XD8tsKyhj2tLVXhiD8DaYSpYq9QRplexsMeLKMV4nQvX8c
         IsAmKsLp10f6iqBSuH0wffMX/Wxa+X8tK2T8SrixEayyInJ2ZvzFRsSegw2dlgnD+5hY
         kQpQDv8exa5CHGag1JrZ/AIIFp/prhtgreKCVlA4wE/t46UIj4stYOcFst+5C/DxJCwv
         EJkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794412205; x=1795017005;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N8P34AsH1fiSX6jG6cafAhHs+En/eyF0au7U2Zb8KIg=;
        b=TtjQ7VCmQo2qZSO6Ym2ISFZ+7i/9mjoJkyUAdx/juTW9b7fQ7cZtEvcP1A6yiJgM3S
         kSZVhOXbVduR9ZBRJYymYexpaeZgMTL07bsi6znK1BXWxe4MzooynaVvh2hz9IV3UGSA
         eMld2SQrmzFAsfaVXe8E74sQn2FgYBlQ1Q4AMOZP8uxEMJx6DGRWdaNIrOkKYUCZcw96
         dbLkHXlUx3W++cf6CLmsOvfy9DjF4D3TouRb9tDmucExgAMay7h3VUE+RcQkU4i8qQym
         zkl8p2imUdD81KE/yQZLS7bKBOmn0sHx9N9VwJgehq/zqly9f8XxSFuOOc3JGxmiI3eI
         tC9Q==
X-Gm-Message-State: APuU4Z/5qqO0kq9JPEY7PR0oVR9dgFRW5jjDVrL5J8CsP672FnOuq21/
	BlarBU1SqOCtqEKO65aR/a1Z5Mhd00fwUJ5OHvmKvTyMB03ltg72PTP92tTPSvt3tfrwDDfC0HG
	w62BAyw87Xip4b8CSkYAcxvWjBXLZwiWMSxFczl8XMZTEa8G9cPMYSdAnmzRyWgJvfUV7jg==
X-Gm-Gg: AYBFou2PDC5QsZrfteLg5rZCl5KVWyxz2//bYCZDB4sNRLsMgbMFx9zyKrSKTBVcZ0O
	eTjoUZAi71tUJMwjx1IJjd4oqkaAPlh9oGzaoXv6vRZbhboNAPyZDlvhQabw4/a/LWxCO4vPGgD
	Z8RXc0T9AopHXHy1Yfu0qBUQYvoagouhIFTFIcagu/DPYWFQDbCgsbrZTiTVMyalx3nO/3GlL6U
	0lTPIUYISQP3XPLhVT/+h3URzBniPZ4GcYTj/Mjj3aTV1ABS+eQZGXcToATgQN4Nf7B52to08qs
	2pVTJGeRAIr8sHqgBZDeevm08ISEzVde0Jesiq8Xusl+r5F0bpntRcaO7Enzm6LEdQKTy3dXJdd
	daV3UP6MnTMvflRu01rcAQOW2nbM9r4w2OjEUc10GPFiu53fOTkgp1tXO23EB+GE11QnROU/0cg
	Dy91/duU5UMfitOFViJ+3Vjz/fMrY=
X-Received: by 2002:a05:7300:f3cd:b0:369:1401:c5c2 with SMTP id 5a478bee46e88-3768675d71bmr3049530eec.26.1794412204153;
        Wed, 11 Nov 2026 07:50:04 -0800 (PST)
X-Received: by 2002:a05:7300:f3cd:b0:369:1401:c5c2 with SMTP id 5a478bee46e88-3768675d71bmr3049347eec.26.1794412198788;
        Wed, 11 Nov 2026 07:49:58 -0800 (PST)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-375218c7c50sm33704924eec.29.2026.11.11.07.49.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 07:49:58 -0800 (PST)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org, Paulson Raja L <lraja@qti.qualcomm.com>
In-Reply-To: <20261106-eht-ba-window-v1-0-622f2272e582@oss.qualcomm.com>
References: <20261106-eht-ba-window-v1-0-622f2272e582@oss.qualcomm.com>
Subject: Re: [PATCH ath-next 0/2] wifi: ath12k: Fix HE BA mode and extend
 buffer size for EHT
Message-Id: <179441219793.2984996.5664366595622303300.b4-ty@b4>
Date: Wed, 11 Nov 2026 07:49:57 -0800
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
X-Proofpoint-GUID: WxOb5GbU-zMfCsMb8XrljV7WwalfBT99
X-Proofpoint-ORIG-GUID: WxOb5GbU-zMfCsMb8XrljV7WwalfBT99
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA2MyBTYWx0ZWRfX4j3s3XlUPg/H
 KVvcGBgF9vPjWsSHRXVRG4kEWZNKQVfya/wqgL/6BIBEoe+qqVp7/pInNcBGkkQU2jnt5oeV1D8
 xsFERqKSbGICC6X+0Gm4g/IbxRpEMHrLsgY935/li1/jc4AHnFGWwxpfpq3qYW2YyuGVdNymUhT
 HXI6UuemA60o2m2B3ZOTi74/SwFLm972aiuFDooNKrrq95i0IhaaDRGuY/g066ejvyZCXjc431J
 BnhuCNG5HW1JaWKZi73xbWjnBrDAWVhtO0/uhh3BkTHmYjR26zs4XZoPBpHMa/nuPGoQEsGnPzN
 gYIM/pUdv6KzubMSK/0bbI6q5tmZs1+I0mDNlj+HWkOYSnKvaCj7oqHU/VFqR0VHcupMBVTx2cC
 S/g8+lDFsOepItlRzOR3V1EIPtZEzabphopd0b0iGhorjVefEG5aGvCYRTedtN6sfwRGpWnqDel
 0yjlP6BlCF9hffzCOYg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA2MyBTYWx0ZWRfXzB7PuWIPI6Z7
 rgLKLIrGBoEowEIrck4cp/ZfSvdI5cnoejYuZPBVVJ6HiNgZhrM1sGnBwhLuwU5F0XlSpMhNUaf
 Utw1v28G3cXMC/ob4tFL9iF+XxGtKp4=
X-Authority-Analysis: v=2.4 cv=Q4BHcI2a c=1 sm=1 tr=0 ts=6af48ead cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=br1bMFRRbvRTlr3IKzEA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_04,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 adultscore=0 suspectscore=0 clxscore=1015 bulkscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611110063


On Fri, 06 Nov 2026 10:27:41 +0530, Rameshkumar Sundaram wrote:
> This series addresses two related issues with Block Acknowledgement (BA)
> configuration for HE and EHT capable links.
> 
> Patch 1 fixes a bug where WMI_VDEV_PARAM_BA_MODE was never configured
> for HE in AP mode. The existing code placed the BA mode configuration
> inside the he_oper.params check, but mac80211 does not populate
> he_oper.params for AP mode, so HE AP links never had BA mode set.
> 
> [...]

Applied, thanks!

[1/2] wifi: ath12k: Fix HE BA mode configuration for AP mode
      commit: 9b4da51a7d78365d920a10791ff216608239892d
[2/2] wifi: ath12k: Extend BA buffer size to 1024 for EHT capable links
      commit: ff4c7359e310744a7abe53cf66d921fa2969eb19

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>

