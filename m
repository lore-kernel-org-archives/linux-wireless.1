Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794260466;
	b=zOkOnNTuYOJIrJ+72/3Lpv34O27WRmeSQsEufdDu/2MC+bdTrubqi6gEPXDYn+EP1Baf
	 OlNeb+rymxQRwAdgvlfV+k8J9NwkN/+GvmuJ88lCiNaT8Q4UCLWio9G/a3YaWW9TtTnvf
	 9bXZsJ3idYsqy27T2kg+CpJWpxbnKnj3HAIgzV8XdtZsR0iotcADYH3i9NoDFipIV/XiB
	 /g8gWqbTwvAmPoNBlh6BoUnGxljEdAFQMKz1mqFCpTh6BBYOJeAzNOCjovZ0CAWXP4tgn
	 FOb5xsDO9Wg9M3NIKcShbp62msxUOiF1jYzlx50Us3VhjntKNkjA5vFg1CSSzNJhvuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794260466;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:In-Reply-To:References:
	 Subject:Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ZhE56GXmmRyFqy+eUTfiOJ/2uZQR2j4nz0W2QLi+boI=;
	b=gSbYoxFsuPXJcV8GaF5arGnY5nqCR/QvmLb7kzYtbUkifLBczSnjvdlcpV7kj6kkU74A
	 cQDS061cZk1ezuWLRNgS9UKSTnheB6gmyZoS/LPRc3jNA2jheHfMk8/4u6aI486qCPJfo
	 5mIwhmQ61F4JBT8i51mzEfaXtjaa39Ivd8WRjc7TxNsRf8AYV6VQ4mpCgmEogzlkjtQdm
	 7cT1LZ6r7dtToUPxgha4W0zzw7M9AcY5vG4OdwlFgqZ5eCF9B6C7jZwfEimwjDwrx21Eo
	 RJbDE16v6M2hxLtCFGKRKjQvOSWrGYfSLCA4PcTDxaxiQs8k/v7+6vaEWfl/MnMbOFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eURiKT3H;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GK7RzmM+;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05122606A332
	for <linux-wireless@vger.kernel.org>; Mon,  9 Nov 2026 21:41:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 05122606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eURiKT3H;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GK7RzmM+
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9LA0lZ435812
	for <linux-wireless@vger.kernel.org>; Mon, 9 Nov 2026 21:41:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZhE56GXmmRyFqy+eUTfiOJ/2uZQR2j4nz0W2QLi+boI=; b=eURiKT3H8WE93c3y
	RkxVynWtnTDIP/28IS77ZbpRtvhtf3v4xO9TOJBSjlLy2e8JvTYWhs+3sr7l2tYC
	fjxvgWLS5mHOjjsgdB2HHFEF0tF1/eCqgT5chvgHDC2S0j5Q87vBGz/X+DyKPS2S
	cK+4Fe4WyVahPMyRa3iZf/ygbNo3+L9KRY0pQYxdXxa/LxTdPLHAhWzpmMWbv/wZ
	w48TN7yXBTJc9g+VUPj0D47w2iTxs9H5Cz3YSIF1/PTtUwpKNPkaOl9R/GHAIs0y
	DHn7el+YOKdPPZ2+OgRlgIdAIOJHbgTKaeBZk7wCmkglOuhP9VZMt1IBO9rMygyG
	H1wmcQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hudcja576-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Mon, 09 Nov 2026 21:41:05 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-37390b2989bso2363437eec.0
        for <linux-wireless@vger.kernel.org>; Mon, 09 Nov 2026 13:41:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794260465; x=1794865265; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZhE56GXmmRyFqy+eUTfiOJ/2uZQR2j4nz0W2QLi+boI=;
        b=GK7RzmM+9XbcstiUDzIg8ypo60Mg8+QgIQ43VSsg2oxOkbOxgWMhqLj63nkmApAQgw
         Q15TF5hy8E6Vp99NraJ3x2Sk5nzokTGBILUQWIp1f7YToN4YJokeFi6W7IPtTFE3pkgI
         hnySR0avAcCPcEiXZWgfE8ZRB2g6Fn7RRLTd7/j0NMkFb/l3HWozOAsU5GDRpeuGNrls
         Qeuj4r0CSEzSkXdYBd6VcXw3IPkte8EhJ2KydeVXsO4TEzsMQ/AcML3SEHGheZ74v5DQ
         6mdxlpxmnge/eVxPtxqvdl+RWyE/mR0HaXPta/z2xMLtU7Kr6MZlJm9d5eTJp/NhJOxM
         umqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794260465; x=1794865265;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZhE56GXmmRyFqy+eUTfiOJ/2uZQR2j4nz0W2QLi+boI=;
        b=lCy+uPSGBFuuWrgIVYNj1S8l+wS22/KfyHjGS6GhZE3CARdXSFBW1E9BwCgP4Qn4SO
         ZRJ/P+noJphlPHbwBDehrdb1MaieNueazk+bokDbPl3e0ed42EniLXkSKFfWDmp+1ENj
         THJmLLyK/YqlSesMOcyCjKAtJ8qsfwT5ctwHYiwtK3jk8bH7xcBfz+/Q3fgi6IGna40Q
         JcH0HOe/0TDb7gvENG4Dusm8WHuuV/8Ssx0r50gY1Mt0zJ39mTor1P2cWr+jY43WVyr+
         w3OkzxnLbGjF4FaFu7Z+YacvEfUZQ1uTIVgaGOXbsFrFz/CBVPRdZxyC/NP7FFyFPgIV
         egfA==
X-Gm-Message-State: APuU4Z8wW6lNurssosLNB+qnNf3g1DARoJ0Z8mTzzegjUciQ2MlerfD4
	xMPmvhIeByNym+1FUa1rSjyumjwEA7FL7u5K0rdjewRUYTdExcOLoq/IyFECeocYYoFyZ1lP2XN
	IM2ROwphbMJVcbQL/STAym/AVgByIUYUu2QF2NMJryUgo77pNIfMz+KxWtnJt0miOAAgAFw==
X-Gm-Gg: AYBFou3rADyt6rN4nt00tqAzn8JStrsganOtCCLF6PQJ5PNCJTGqaCGTqltIY/aPCps
	lKnwucEa1wODEebcuS+xsUkkYgGYarnbnNfPlGE8yhrpptLxggjDEYi74lAKoC2h9byZxvQ5lVq
	D7k7+7NjSCkBdsukOVCD04i3f1WytxnmsiA3oOh517Z3hwWrKeG62cJ+NUHJ02UXz9Um8OLYfF6
	PEIUEuBm1rW5h8aTOqfrJdfaoS9GRsfDFqlQB/5+5C0qoSXC0itsHkas8b2LvKj6JeSZr8wNLZV
	Qei2XyK+HiM54p9LQyqzqe4C3wnNqELz7+1nuWRxsjr8E8Y9IdfmHib7kM+qb2INM1nUaTpGbfE
	du2wtVH6PxVwLS5DvbnvPIXoyGlYUfK2ZKHCiEMsJwyKqWt8qOOFLtYQdO/TqPZbxFwxQ0u0e65
	EM+rzSfXDThsSBHnut92MwhVolTNM=
X-Received: by 2002:a05:693c:4007:b0:371:ede8:3e9b with SMTP id 5a478bee46e88-3751fb368eemr735797eec.36.1794260464447;
        Mon, 09 Nov 2026 13:41:04 -0800 (PST)
X-Received: by 2002:a05:693c:4007:b0:371:ede8:3e9b with SMTP id 5a478bee46e88-3751fb368eemr735761eec.36.1794260463774;
        Mon, 09 Nov 2026 13:41:03 -0800 (PST)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520512ec1sm989985eec.12.2026.11.09.13.41.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 13:41:01 -0800 (PST)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
In-Reply-To: <20261104-db9e3c75b3-wifi-ath12k-1@mail.sdu.edu.cn>
References: <20261104-db9e3c75b3-wifi-ath12k-1@mail.sdu.edu.cn>
Subject: Re: [PATCH] wifi: ath12k: Fix potential SRNG configuration leak on
 init failure
Message-Id: <179426046162.3811579.4898140189159012556.b4-ty@b4>
Date: Mon, 09 Nov 2026 13:41:01 -0800
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
X-Proofpoint-GUID: 8lOvbEFRxZXO9y9C__ZIEuKzZuZ5XbkZ
X-Proofpoint-ORIG-GUID: 8lOvbEFRxZXO9y9C__ZIEuKzZuZ5XbkZ
X-Authority-Analysis: v=2.4 cv=au0nmiZV c=1 sm=1 tr=0 ts=6af23df1 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=1y-X7YYiyRxnpW_vcDcA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA4NiBTYWx0ZWRfX1YMyfiI3kxRM
 26FmRP2L1/XVoqw1cRUyxTv9RX3VNtobk3SXxdyLz4QrGt4XnXVPrbisbqTllVDjPjRp6QUluxs
 /flG7amCEHhbLY9Mrfyac4OMWxCoShg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA4NiBTYWx0ZWRfXyp7wIXOXeTvm
 HW0zbRKdmXSujCUj8j/XtmmaWVqK8hKZUdskgtNzoOobn3lE3CfD7p4piKk4l+hOued1NuRdBYx
 Irv5JA4euiUGeHDTm20qUWkMqMMoP1eUJ1TG+qYeNXeCrhBui+/ddNuDq4Lch7I6UaY2keA1QY5
 PD067KP7PwrXf0iSxeANnvlk+kkHheskVa+BlUY70P22IykOqFNCYudwWwOwJIzgFqa8srg+Gs3
 uVu4O0+VQImMr+cCPWH0CtWe/gvFTpWCRIC/MtubPor4vWsP7fSQMT5TETc8lkTjCuTkgQ8rVrJ
 wG5YsMDWPeyFxkBdb64LejOV8wj93F/AC/O+Ydlxi0+3nr02PBlukHbSc6wGvse7agG+rafJT9p
 es4Cwd+/D4j3XyuKIWtDGgI13DVItEQA6IJFQI8FX7+zNhaeRiLqT3amIPIPTfgvtd2rJaue/lB
 DDHh94gozeSvSHYz8Bg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_07,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 suspectscore=0 bulkscore=0 impostorscore=0
 phishscore=0 clxscore=1015 malwarescore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611090086


On Wed, 04 Nov 2026 10:33:44 +0800, Guangshuo Li wrote:
> If either DMA pointer-buffer allocation fails after the SRNG
> configuration is copied, HAL initialization returns without freeing
> the copy. Its callers skip HAL deinitialization on this error.
> 
> Free the configuration on both allocation failure paths and clear
> its pointer before returning.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: Fix potential SRNG configuration leak on init failure
      commit: 30cd6ad81f234ee01dc67b1d1166db94078edad5

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>

