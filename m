Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793980876;
	b=1nSLHY6vvv89dhj/uVRszu5LBIubdZp2z8r1V96UOHotr7vjDitcMfydZXS5ZMMtfEmQ
	 Zmb/31GpoeGQmP6aEJuJ7T2ymEbr0y/fKD1KC5bAqHs+UtF51qccUvpcB6w6GSgezwysW
	 Tuwc7Hc+pd6qgwZfuLFO/GF/ZPjXwpgm97H6IMOQjl7tXhGD4qCKkesaay3PLXXFJa/pL
	 xM4dNY/CkhhPfQ0gIsI3ACRI/6e6HdIHeZZDdiaIhSvEQMSeVP4PT2ld3QahRRLsUTURA
	 2pbXFsP+/cqxvz9zvZBmtf4rS0fsP6Prapc5c95fXUfy+3RD6VVmxGEBWCHRlUarVVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793980876;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 In-Reply-To:References:Subject:Message-Id:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Mailer:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=4shQ3DR/ZJ0GAB6tttMcp+Ec4N2k1PGmXpuQWgxxLTc=;
	b=0JEoVvwwUi2uY4h5cgzYNJMufew3XplaAku3T+wLcpp0ljcU3FcPBb3ynNY58ml3ux3k
	 z+BCY1Me1rnFzQ5eGyAwO6AviwPJDLo3jTbEyW2hc3DZCX29zZDvGlJwPAqmYLbKf2umT
	 XPwf09i4F0mf6XCRuuElkCfyRGtIcKGa6hfRP8I2BZ18D1dBaQWrP+r+E+JphfaFhm6gG
	 +kIsLqY2FMoQoHWKreUzjKD++/AV40RmO0QYNMhXKRk+nloLmB06mn6FBqkaLMh8I1NBG
	 X1m8LIpnQ0g9wLKDniiIG6YZWdCPaYck8V1mQcf/GH294GZJRmauUHoMhi6PZw/boXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QEC5Cqof;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LaSCeof6;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F25EE606A335
	for <linux-wireless@vger.kernel.org>; Fri,  6 Nov 2026 16:01:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F25EE606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QEC5Cqof;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LaSCeof6
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6F07jB103039
	for <linux-wireless@vger.kernel.org>; Fri, 6 Nov 2026 16:01:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4shQ3DR/ZJ0GAB6tttMcp+Ec4N2k1PGmXpuQWgxxLTc=; b=QEC5CqofczzFYdiT
	Klabmuw7jmHLhhS1rjVfZkdrtbWxQJvK3fnfwSPg7n/giJ9UKzM7wGsDBHRKZ5gE
	XBy2QquSBjF2VRj8XvV2un1l/wzJyAQmCDSWa+yAS0fAe5YuiMCX83gCdELjcpjk
	a8yOQFU/octofu+Gm68hmhp90WpOMgooB3GksyrzoVGYb/943kKeyvX+Ine9uy6o
	8UxVrXGfpS3SViaa3haFBu2FJW5kIyMCUZcrov1MZkMC1PoIQ4nWj0m7PHLZEukI
	YFSmkPPN9s6OU4mOxLeOh15oYAaweWtpEgPP3vX566fVko9MtWapGqdUR3nSXw4J
	/kwLqA==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3pa3j7k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Fri, 06 Nov 2026 16:01:14 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-14373747468so1388247c88.1
        for <linux-wireless@vger.kernel.org>; Fri, 06 Nov 2026 08:01:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793980874; x=1794585674; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4shQ3DR/ZJ0GAB6tttMcp+Ec4N2k1PGmXpuQWgxxLTc=;
        b=LaSCeof662CO8j77dcpAjNnnmYOROwSt4LFOaOazzJoS4zlE9HdSXXjdaqdmeYLxIE
         JxSqrkIXXZdkhKDh+7Pm6k04hoibVCWiRpdEAUpFLjm2HIEX0crlTU8xTNxAifV+9tfy
         Z0VNYl7WjwPZOVRmX1V4P9o1/uTAO0FiJRVGjYmxzXZMEsR2gg2/HuAA9bJsWZgBLt3K
         GgzRLV2Z6hiTesPBB+1ESh1YxOX2O10MkcRdjA4Vmc6aGyzwRB0EyBGUeuKbUDJY8Gzn
         8TaIt7EEaLccGnMGCuDqGSTL6WQsZZ3aK+KND7onltK5vj4LknXNMhV9sopGel21EHsR
         /zWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793980874; x=1794585674;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4shQ3DR/ZJ0GAB6tttMcp+Ec4N2k1PGmXpuQWgxxLTc=;
        b=JIN0FDLkjfQmQ7fHvc2xJrPXj1OdqxZe9N3FGvAF30/iusGG/Zflv6kARKVx56N/n1
         jol1Cgm4hiRVFR8UDSbdZhNhzbrwVaU9GwBLiCUfI/8rGEEEFzrUopSECopgny9YeMAD
         3cl/Kxjht1yPnzz6gZJB4NClsEePkxQMsKgHEJ/yj7OzOiwOVm/hAW8Km477VnqkTQXC
         C4LjXae3bINSOmrLE635k+lsvJ1FRN04rCxbjAEKZ45hHnOvc8Oa+T6d/nrMrT+PQ7xp
         kilOc5pCZMNaLxr+OOZ3xrg9rzOrE2j6QE4+qsEfXfvIz9ZHB1DPt0hr8+3V06zUPYAo
         BHAQ==
X-Forwarded-Encrypted: i=1; AKwUvBzuTlWd6JRlfctEzQMPhmk9rLZ4MNQ26eJkVEahGOsWpo0oay6aVD8Wsv4/B68krx7jl2y1YtneIEX3cfigtQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z9d+H1UUQ6BiAN5dRZ7nak58LaefjJs9jIZ6XEZKkbjUGa8urjz
	GhpdqrjZgpzC2DKgMLyIkB+SJlCxsGXme21dX9sNEil2GNg79hHIHuoBtxaitppx2PRmeOEx10l
	WlnOZ5nTAKA+td8X8OegoQJX3NHKVIAp410gVu1xMFNMNVDHyLoVcNPs88uJU30z3EJZX0UBWYp
	dqZw==
X-Gm-Gg: AYBFou3fnBPVvxyg5FwY2oEsaULKevgD6zDch4MuenzUn1+tv3WQq8oI2n4iLGCavtX
	La2yrVxDBwumzarZi7jG2VbmJbfC1WwaRe50/88GmDIYc3wu5qBzmLUyCJzdU9CMYX9KZDk3oBW
	4j7YGbmL4+sQxiDq1uesiXoycqtV3Li14WEbkEou9TPBf5C7CmvEW4XSm+whHNrAzcyPSiajNeg
	qgBHV01wJehGTe/EgG7ufKhZcuoauQPaD2CikO1TeZm2kDR+peQf3JjOfplJz96hQpVUg1doIiM
	PsGWBXKDzQzRo5S19kNjy+D3fI/FcKJzfcx8WvAuSjiF6kYc/6ImC6f5B2Yw0DTpzpbSJgnmtSt
	TO5mcijp1YoFWq+YgX0yb3lb2hJ3tJB3Vc6Ah6/WZeKjAs7TLfO2NilDl+8t4yQ6pbVb60v8CCq
	J0Xi1MOu0mPkUI8naNZAbm+4MKkik=
X-Received: by 2002:a05:7022:1002:b0:1b2:43cc:48 with SMTP id a92af1059eb24-1b25d31e8c9mr4253031c88.33.1793980873279;
        Fri, 06 Nov 2026 08:01:13 -0800 (PST)
X-Received: by 2002:a05:7022:1002:b0:1b2:43cc:48 with SMTP id a92af1059eb24-1b25d31e8c9mr4252947c88.33.1793980872194;
        Fri, 06 Nov 2026 08:01:12 -0800 (PST)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b25e407bb5sm7010229c88.1.2026.11.06.08.01.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 08:01:11 -0800 (PST)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: =?utf-8?q?Toke_H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>,
        Michail Andreas Michalopoulos <mike.michalo@gmail.com>
Cc: Pengpeng Hou <pengpeng@iscas.ac.cn>, Mehmet Fide <mehmet.fide@gmail.com>,
        linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261020152412.95560-1-mike.michalo@gmail.com>
References: <20261020152412.95560-1-mike.michalo@gmail.com>
Subject: Re: [PATCH 0/2] wifi: ath9k: fix WMI command response handling
Message-Id: <179398087095.1316624.10795269671758112947.b4-ty@b4>
Date: Fri, 06 Nov 2026 08:01:10 -0800
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA2MyBTYWx0ZWRfX/RjzTxRkRKDr
 da5IxVSUP3y988cvfBlA8kMeJ5C3PZkQtduL/Tch1JIcwalRSCxoJjZnzCbq0bndueA+42kfPrJ
 2xNgpIGzwPrp0GsI1jYW5KdwAaqZVgb6CdayDKdfTma0ZhNE0XEqUr8sGI9EFiBlXPbD/4R0dj6
 8zF/Lq4RTVEePWmOtsK04k8fFuwYa9T+fYYnM/ohhBE7O6HTnEhCxUY7IHYlXguOjUqzRton6x+
 X5A5OrvIDSSTjR0DnkVU+zgO/3c283+y2gEZ57Yqy4av0G1WOAlag28rNWL6OkePSwkNxhnDr9z
 RUEnniOB0yt6XkUduAEfBpH38PIt+i16wfVAo2Rs59uftURIM77ini/kwPsJYwEKLd8mhtxrMmM
 Bd+Drr/E7avxQpgkYrffin+qsQe135Oad1kEPPO+xQHlhJ1Ky2XS8ZkSJt4H30XW4ZE/5rpU5dc
 HCW9aQY/Bhy0F3eD0iw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA2MyBTYWx0ZWRfXx35gYwzhMYbe
 +J3hINrS9xWS0zVGTRCJhh5UpxOaF7fr4wseMQkUEZT0iwyVHyk0RwZK+govd5pEfOnul1K3gRa
 6W9RksxRWvwsJME5pHKOyqyeUVzsRrQ=
X-Proofpoint-ORIG-GUID: _GJt0znWp4PtO9jgaAH_hUGcd7Vpe4kv
X-Authority-Analysis: v=2.4 cv=GpzXaU1C c=1 sm=1 tr=0 ts=6aedf9ca cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=3COdopjRG8TIgARh_PMA:9 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-GUID: _GJt0znWp4PtO9jgaAH_hUGcd7Vpe4kv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0 malwarescore=0
 priorityscore=1501 phishscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060063


On Tue, 20 Oct 2026 17:24:10 +0200, Michail Andreas Michalopoulos wrote:
> Both patches fix the ath9k_htc WMI command response path.
> 
> Patch 1 stops ath9k_wmi_rsp_callback() from copying bytes the device
> did not send. It replaces the -EMSGSIZE approach that was reverted in
> commit 90201351a862: short and empty responses still complete, and the
> rest of the caller's buffer is zeroed.
> 
> [...]

Applied, thanks!

[1/2] wifi: ath9k: don't read past short WMI command responses
      commit: cb1c171e3210d99d0fd5dceff24360e2bd04029e
[2/2] wifi: ath9k: drop WMI command responses when no command is pending
      commit: ad6bdd5f9030dbcf29a67f40ccdb3fa57afecff5

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>

