Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793990141;
	b=ApXWR+hEOK6VY5vkp5ttNROIe4QXxUflM9qjk0o3RQqnJg2nS7CaYOMiWgfLGkQzsPeC
	 +bQvIwomrIWRIK0al+qxm6bFn0X2Q2Ea39plXczavFkdABU9TN7HOHOz5if1LaTtmoDGt
	 skimY/knj+KXTC4oxMYrN6M/fnSyOm5lTPwiLhVpdPY7abBIEgOtCpb+1So54jfce2BaU
	 whl045uwEf26h3XHLrT9RnZwax1Qm0U3N6pw/0YV5CIFyP72ncx/JvXfjARinByTmZBfb
	 lUE4RfqXQa3h0CS6R/f+EWmxOcmIWkmhnF16gGVKUbQM4YxujQuIbmRHOixKFJsPhGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793990141;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=v4xi9zjLk/JnFBwNsX03J7ooArpolpgt1TZbGipdHrs=;
	b=sc8SXUvgBtSIH+E1RA1G5qdI5Jo55HJnMAoYJzR6slrxRREC6QMeuZswwZb0FW/dA19d
	 PmP+TIu2CSibZ+JM22u+o/dxNZui2YrspoH2P6ws75vEtYrDEVeu1E7cP/55mTPxjvPn6
	 awll/V4Z3rjWLF8l82aklbEKuvmxrmUUxXgQ0eUCA978r5TBAWkohhiwJTmESMNMSoglL
	 NRNMKgY35FI8GHOvbPuEGdW+jIOpPYkZf90VYKrC+ZV2WbAfYME5iVRkESNr0aw32HKKS
	 VpkYkewHx3Ot9UG9xA0Tcb5kDrvRtIoffMbxQjnCCtgziBv8mVD1SF43hwyRu1Mvu5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=P8K5NNlF;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cqR151tJ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE9FA606A329
	for <linux-wireless@vger.kernel.org>; Fri,  6 Nov 2026 18:35:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EE9FA606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=P8K5NNlF;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cqR151tJ
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6HspSN3712134
	for <linux-wireless@vger.kernel.org>; Fri, 6 Nov 2026 18:35:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	v4xi9zjLk/JnFBwNsX03J7ooArpolpgt1TZbGipdHrs=; b=P8K5NNlFrrqItXqT
	n2b3FmqBmj6ylC9Gr3Gt8NTQwaMlnX7fCC8bp8Sj1yOXonXgIE2PF5WlAVOv7HmW
	IWG+C6zqEbbpHE7BjV39imBno+jh0rixVHexhC14kUiB689iu0y34vNW1rVWjCkA
	UNsrHgBbRmgu+ocu+pnBymNw5w5+vBFbiR1ofhh18TNlu4rxRLJE/e8t+FBBtoMR
	itEx4AAupsvsEfART7q93Bkaz8Cl6P/AsVtFgiqtsYGoNMt/dO9J9PTn3rm0U1pd
	TjzZXvgOBsCzneB0bYvRci4+84zcfSd8gjJbW3Qa5imgOegHSihi2QV5wefEbeVm
	Bt1eyA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3p9c7r1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Fri, 06 Nov 2026 18:35:40 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-36f26e6abe9so1640439eec.0
        for <linux-wireless@vger.kernel.org>; Fri, 06 Nov 2026 10:35:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793990140; x=1794594940; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v4xi9zjLk/JnFBwNsX03J7ooArpolpgt1TZbGipdHrs=;
        b=cqR151tJGCnB+2aarRrhi04f6XLjWTGFoe7ACkN0c5v3BIE0zJpLLSHgfqnnen0pbp
         2s9fglZx0l7Z/csYEZpIZICvM0EuGF1GNZoSBO7+7N6b4CD85ybjxP54ogRu39mMQ7Z9
         tWwJRrWTQLTsyfIz+ej+oLaXYdI/HG61RpAsVVh+s34wq6L7Cr5uCCJ5TbceXJnzXvfc
         +nZNwaQiOCxMzWPw6Y03pqNka8mkxRcVouLr5yv0b5pbJ54Ics+XcIS/Nb+PiJ8DNjdb
         M5l62/N5PxcQt3KrvXB6bTf54DgoXfP0Bzjj4J9cieRiaPBEzcVl3bYbQk6v7XYnfE7D
         b/aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793990140; x=1794594940;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v4xi9zjLk/JnFBwNsX03J7ooArpolpgt1TZbGipdHrs=;
        b=pxVypoznTEfUStEwn5UZ6YMtURgc/uw8qc9yQonUedhRJ4Fe/cgkrciGnfhI/X2eVw
         rJOrBkQMnvUYEHI5kPLVgMx53pO6ED2GyaO6XnTQGZHLBOI+2IW4O2iz/tWnKE/SICF0
         0exo7Nu0oZ6yVhad2TzfikpUF2QPiHhhP4gtPRr/HehFV9ssviO6kFWeOdqCseYQEyzv
         HBtMNTC7uEP04zg7w2MMsCgh4FawZH0n9TGOdPmbrYAS10NaNFsnClENw2kS2F38mZQw
         fgIiWF+bkBKUYTi55giB2x5GjEG7zEJlJSbSRy+Ji838udjEwauN00vqaHLb1UNpH2AY
         zvSQ==
X-Gm-Message-State: APuU4Z9IjTPYZyg/xBuNV1p68h9OC+G4WbdLNl6e+nKkY/kGu4G9H2ip
	CD0F2WC48jOH1FQY8EtvFn3OU3RbmCDxHFHcEtON8h7H7Gmbf75Bz1GvxHAGJsVQwJHjaCVt8/7
	gBwq+oc99wxnnxtNyU2BpV1zW/xNVPD+VDcROsInUQXKu39kUApcCVBcmBixThRnvZLtFtQ==
X-Gm-Gg: AYBFou1Xjr8EFp0vW65nqRbLuYPiPyuplA/JauuhMnBUWOQEkbXAzLwH/T2xhHNFmIK
	VB7yKSPEwEp448x2gr+vbAy9H8sosIcGyRhgtSfKc/PqKlT6E2BPifk1oVaVgXb4UgHfhMLGKUD
	LWB0zOQd3BLEBAIQoUwZ76a87JaTpxsVUqTqCDziNFHDHtKEZwfLbmiSgBh3N0MZpeLRzbA3xwv
	2+FMmimobi0YtExBl7QvExWHDMLLnsa7mbCJfzGD9MpSb+mSR8JBnYn68yeMG9deZafpY+i0hrA
	8swt7jcZRdwbqyh9Na+W9vuOG4Cql4lMIP9z7WbC5wKmko7lTXsCptQmn8gIaNTr+18QmeU+v4D
	/rOqoNYafxRkZ5jFPR3y7z2G0rqMRt+Tm0GtdfgK5oXNE14idF3+0LkEGMJWaYEtg3l7K8CFW/C
	arVQ/flbFDpp1bG+I=
X-Received: by 2002:a05:7301:fd0a:b0:36a:31b2:8643 with SMTP id 5a478bee46e88-36f774f5c3fmr4397673eec.38.1793990139021;
        Fri, 06 Nov 2026 10:35:39 -0800 (PST)
X-Received: by 2002:a05:7301:fd0a:b0:36a:31b2:8643 with SMTP id 5a478bee46e88-36f774f5c3fmr4397636eec.38.1793990138362;
        Fri, 06 Nov 2026 10:35:38 -0800 (PST)
Received: from [192.168.0.3] ([49.205.82.39])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa922c6c7sm10347444eec.10.2026.11.06.10.35.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Nov 2026 10:35:37 -0800 (PST)
Message-ID: <1ad8a442-278b-4db3-97c7-82e0a77b201b@oss.qualcomm.com>
Date: Sat, 7 Nov 2026 00:05:31 +0530
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next v3 00/17] wifi: ath12k: Add support for QCN6432
To: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ath12k@lists.infradead.org,
        Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>
References: <20261023-mpp-bringup-v3-0-19f3fcbf7b5f@oss.qualcomm.com>
Content-Language: en-US
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20261023-mpp-bringup-v3-0-19f3fcbf7b5f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: _RXe-uKqo0wcbT7kCKG-QsOBfLZXrsp5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA3NCBTYWx0ZWRfX3mQXNY3ROs/t
 5IAGBoBeABwFmd6e7tt2Qrf0qGYWLwCVV4mlpDnYxSmFK6PUJLxNjSClCqKgIxsZw8vVtWf6bvb
 rr7eaVL+G0ytH7k4Dk4oYkLxUXpNvsJyi+doeEa8qwj/FZyhNf7L8ZM0xeAICs6raeho83gCUrC
 msz79IoAHnM8St9dzdoeRwmAuc99h7Wy44RNfshRnz9AzUZZJQa6J4inMgTa4ktvMy+oDkqL3dm
 tXwdLDpqSHfNUaD/G/N67Qq2LPxxvj5wVVmVDNVEttUAAAGGAXhrwd+MJ8exBWLFh1ZkgvKcqB3
 b2asj2Ln92zqlplHT1xqR9it+dTdYutvRKH8iBnTpHHoNdm+UVrFhNoE59N8o0EfQdNw84K1KHA
 CpK8nu/WLLtOuETDeyg2PEQeNBGEvmpNJhMYts/8Wk7Hn5TUtj203smEkmPu0lMBQkTntVLJvMg
 hMbDzEizlUD6oBDzJjg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA3NCBTYWx0ZWRfXyjQS3KuprZAy
 FMG2yBigydR6sRSzGDMPpe5EJr2zVYL3T4cffkVXH06SFhROYtSbWO9cZQBZ+mAcVvGMfaRBO46
 m4Dhkgzj+hDwRxfFUeqAmriksqTX8XA=
X-Authority-Analysis: v=2.4 cv=WMzqzXsR c=1 sm=1 tr=0 ts=6aee1dfc cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=Yi4Dc0+RdECwe4ym5Eh06w==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=Jrv9ZmiOdEm1SHuq7XcA:9
 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: _RXe-uKqo0wcbT7kCKG-QsOBfLZXrsp5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_06,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060074



On 23-10-2026 12:31, Aaradhana Sahu wrote:
> QCN6432 is a PCIe-based device attached to the WCSS Q6 processor. It is
> registered as a platform device (AHB), and remoteproc APIs are used to
> boot and shut down the device, similar to other AHB-based devices such
> as IPQ5332.
> 
> However, PCI APIs are used for device setup and register access. Since
> QCN6432 requires both AHB and PCI APIs for its operation, a hybrid
> AHB/PCI approach is implemented.
> 
> Overview:
>    - Patch [1/17] adds DT binding documentation for QCN6432.
>    - Patch [2/17] refactors PCI operations and MSI config structure to
>      support different MSI configurations.
>    - Patches [3,4,5/17] add hardware parameters, ring mask, and registers
>      for QCN6432.
>    - Patch [6/17] moves multi MSI vector flag to ath12k_dev_flags.
>    - Patches [7,8/17] add hybrid_bus_type and HIF operations support for
>      QCN6432.
>    - Patch [9/17] adds support for unified data-region memory allocation.
>    - Patch [10/17] moves MSI config to pcic for better abstraction.
>    - Patches [11,12/17] enable MSI interrupt support for CE and DP rings
>      specific to QCN6432.
>    - Patch [13/17] uses CMEM write for PPT on hybrid bus devices.
>    - Patch [14/17] stores and uses per CE DP MSI data for QCN6432.
>    - Patch [15/17] derives QMI service instance ID per protection domain.
>    - Patch [16/17] add userpd ID mapping per device.
>    - Patch [17/17] adds support for QCN6432 in the driver.
> 
> Changes in v3:
> - patch 1/17: Update the commit subject and change the file name.
> - patch 3/17: Initialize qmi_max_chunk_size for QCN6432.
> - Link to v2: https://patch.msgid.link/20261016-mpp-bringup-v2-0-f510c33bfcf5@oss.qualcomm.com
> 
> Changes in v2:
> - patch 1/17: Update the compatible string from qcom,qcn6432-wifi to qcom,qcn6432 and remove the | character.
> - patch 11/17 and patch 12/17: Fix resource leaks on probe error paths.
> - patch 16/17: Move the NULL check before the loop.
> - Link to v1: https://lore.kernel.org/linux-wireless/20261008-mpp_bringup-v1-0-2c5797b5e4ac@oss.qualcomm.com/
> 
> ---
> Aaradhana Sahu (10):
>        dt-bindings: net: wireless: Add QCN6432
>        wifi: ath12k: Refactor PCI operations and MSI config structure
>        wifi: ath12k: move multi MSI vector flag to ath12k_dev_flags
>        wifi: ath12k: Add hybrid_bus_type in ath12k_hw_params
>        wifi: ath12k: add support for unified data-region memory allocation
>        wifi: ath12k: move MSI config to pci.c
>        wifi: ath12k: Add platform MSI support for CE
>        wifi: ath12k: use CMEM write for PPT on hybrid bus devices
>        wifi: ath12k: Resolve userPD ID per device
>        wifi: ath12k: Add QCN6432 AHB support
> 
> Sowmiya Sree Elavalagan (7):
>        wifi: ath12k: Add hardware parameter for QCN6432
>        wifi: ath12k: Add hardware ring mask for QCN6432
>        wifi: ath12k: add hardware registers for QCN6432
>        wifi: ath12k: Add hif operation support for QCN6432
>        wifi: ath12k: Enable MSI interrupt support for DP interrupt
>        wifi: ath12k: store and use MSI data per CE and DP interrupt group for QCN6432
>        wifi: ath12k: Derive QMI service instance ID per protection domain
>   
>   .../bindings/net/wireless/qcom,qcn6432.yaml        | 149 +++++++
>   drivers/net/wireless/ath/ath12k/Makefile           |   2 +-
>   drivers/net/wireless/ath/ath12k/ahb.c              |  54 ++-
>   drivers/net/wireless/ath/ath12k/ahb.h              |  10 +-
>   drivers/net/wireless/ath/ath12k/ce.c               |   7 +-
>   drivers/net/wireless/ath/ath12k/ce.h               |   6 +
>   drivers/net/wireless/ath/ath12k/core.c             |  10 +-
>   drivers/net/wireless/ath/ath12k/core.h             |  24 ++
>   drivers/net/wireless/ath/ath12k/dp.c               |  39 +-
>   drivers/net/wireless/ath/ath12k/dp.h               |   2 +-
>   drivers/net/wireless/ath/ath12k/hif.h              |  30 ++
>   drivers/net/wireless/ath/ath12k/hw.h               |   8 +-
>   drivers/net/wireless/ath/ath12k/mhi.c              |   4 +-
>   drivers/net/wireless/ath/ath12k/pci.c              | 111 +++---
>   drivers/net/wireless/ath/ath12k/pci.h              |  21 +-
>   drivers/net/wireless/ath/ath12k/pcic.c             | 435 +++++++++++++++++++++
>   drivers/net/wireless/ath/ath12k/pcic.h             |  24 ++
>   drivers/net/wireless/ath/ath12k/qmi.c              |  83 +++-
>   drivers/net/wireless/ath/ath12k/qmi.h              |   1 +
>   drivers/net/wireless/ath/ath12k/wifi7/ahb.c        |  45 ++-
>   drivers/net/wireless/ath/ath12k/wifi7/hal.c        |   7 +
>   .../net/wireless/ath/ath12k/wifi7/hal_qcn9274.c    |  85 ++++
>   .../net/wireless/ath/ath12k/wifi7/hal_qcn9274.h    |   1 +
>   drivers/net/wireless/ath/ath12k/wifi7/hw.c         | 143 +++++++
>   drivers/net/wireless/ath/ath12k/wifi7/pci.c        |  22 +-
>   25 files changed, 1214 insertions(+), 109 deletions(-)

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
