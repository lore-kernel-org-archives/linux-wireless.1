Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795028444;
	b=FWfIEFE8ErSvOOzXLOgr9faI7leXWzh92dS2xjXdVjpSPa4aJXtG1RbxXHKXLXXG+R/t
	 xY7XzFXJWXCjwYkd69Wgil8MkyYNcdUU6Z3IVxbW1gPDbkX8jDOevGvBdEKm46GNKuk3C
	 w9t5V8RbQHBGJCPnaGMXLFjLoEW6KbhkqhmtLb1WJ3CfuUnzZ7yhFxCfnM6mM1RtGaTFt
	 7+rcwQ9quRkm314J70IhtR80q3nhX57xvACPPofc9mVJODYvZqr4Hari2t+nBs3Ev8OT+
	 Y8nttln4Nk3AxnBbNXwEODG8mp87V9BP4FD0mZNp1TUrn7dmupZ+VYEmZhE7kGwVAfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795028444;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:To:Cc:Subject:Content-Language:From:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=c8s7W03u8xrPY2+8UUOn5CnU3KETPxQF/eEC5uNB4ik=;
	b=MiAVPuAQQpTXZG+SiTkhj7GK505sH8p7hf5hDhX61M0fOr5xWZs1AFksNbfGi7YA17Nb
	 GCaWAeR9gmMsrBlMCQT6BL0RczAiloGJWGNu6KABKAHRdoKpoS1P+aSE7rT92wtO7wqDo
	 kMif+CYldlq4bTPdLqQJ/mV5vkZCSgEScxzjLUcOWrO2GQmWQyJCyKOaNWPule4GFNh76
	 rH0FPfKbhfYxwRRnIh+pIgYep54t19C1U+MeZYcvATd33FzNhENznPXFRLaYFP5eO8Nig
	 uWXbKlxNTsgHRgow5rXzNss/sut2H9yMKxaL5ciKCEgTqmh3KEs1Qpn38+sPvl8H5Hw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ooPOdwhb;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QnakOPQw;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77EDF606A325
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 19:00:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77EDF606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ooPOdwhb;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QnakOPQw
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AIHGjPb1155212
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 19:00:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=c8s7W03u8xrPY2+8UUOn5C
	nU3KETPxQF/eEC5uNB4ik=; b=ooPOdwhb8m5hUgHSbMZJgxSfPCdCGcL++O5yS6
	lf7GiSIdFlc8RDJD7E3KQPlFyk4QV9uwpBJehGGIEFoMzTvCCm7Hdr75ltQ3Bknj
	19iWp7Zsv/qc6rkTZMDla8Lc2M/vKwzhJUU1glIv9EYI7q9NFJWesG60xAPc61EG
	rh1oyteFV3LWpDXI9n+3kwZbsQsjSKSYC/7R5YWbPel4ErwZr7nlKN0Mv4nrwByn
	pndMSrMKQGkKtIOoqSROEnv9L+OOmi+NRSGxMF0RmG+cw7FmPNzzxNeWsjn9VEBS
	186m6BQj9fsypm0KaSlp5h4a6nJ3ojVI4ziEiBje5/1ddhMw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1g9egf4p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 19:00:40 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3b3b4208826so76342a91.1
        for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 11:00:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795028440; x=1795633240; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:from:content-language
         :subject:cc:to:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=c8s7W03u8xrPY2+8UUOn5CnU3KETPxQF/eEC5uNB4ik=;
        b=QnakOPQwhKf3wOqg2UAFg33bqv4A5gtPVf4gbs2FMus7iMq0ikaKX5ivK8fLXejWiU
         c2XcfNhd05KCvoF+RJlPR8eyCD6Acf7yJsAe3LQgbHHLNZt3PdORS4vKAmnVQuijUxME
         /2FibaWFM7qGZcE3zPAX/BCIW0qMCKp4bhX595xqTZtQF8RrAWIvqlrTlN3gssw8gIyJ
         eT22hpMbXAKtbsHBNzk73NnDshBfPfAQ1+oLqfH3rl1DCZURZUY9yfs8VCRWdzGcLL43
         IYYFGwe8WljBBz8Yv9lwC1XZ6aUTUv6HNn7Vfk/QPlWRYpv9B87tgAHVqw03vk10Y1+s
         /dkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795028440; x=1795633240;
        h=content-transfer-encoding:content-type:from:content-language
         :subject:cc:to:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c8s7W03u8xrPY2+8UUOn5CnU3KETPxQF/eEC5uNB4ik=;
        b=fuAMBK71YRJO2rnE8zG1RJb0H65fnniZYRyKa/Rewc3SkGBgfl6rCBvcn/YfaaefCR
         EA2IPjyGDSeUBQPrtqB5np9QRXhRoZLuN17zpglEgKcDN7TlfLKmrNluCnBqaK0ga/m1
         SX9zoHqo9KoS3ZlwO86CzRwEH3DjHIUalpCIEfVgB7z3xPRhHWmjUvZR9rYRKe55ZN5j
         E33bFT4Edew0WYmse/AEdI68aFNedsv8RTIGNxz3TyxK/b4yRPlI0bfYpjXJlHjbQWE5
         qOZJmocw1Nv1Jmw9QfffU/S/9ecVQZlTsdDJnIBu6ALIkA0gHWo23+zGFk7tOSvRq+U5
         kDGw==
X-Gm-Message-State: APuU4Z/9JD31dOcoxLaAaq4+jKHcs5GxghyIodTuP4RsIqSyRVXowNDP
	VtQPsctCOl9KmVONR4411xOWSAV+YEhq1eh+NK5gQmhzxLd91vzAkwNv5757AqafZrruvI6ICQB
	JKtyR64Ey0Y72A835te8WxH3DBEZMNitf7vcHdxCgM3AVfdZB2o51oJHLyr/sKiD4uNEXOWf5h8
	NAfg==
X-Gm-Gg: AZFdTZdg0nTviSS648OfFkqrmelv7w/oURS/qikFk5G5mfq4vJciB3EEW0xnXgoF4Z0
	eXUhnyZYRJDC54uM/VEcR65SO5VY/uW6IKse7vVUYfUljwgw4B00qAz1Y1jR92FZc8Btnj1uhLu
	9eVENfnBLTCEY1ejQUfyyTb/WSdivfvvsDmdPg76kCsC2YHlqxuma4P0bGNYhWOeAWKBNVcvGvT
	jNfQ9CkaM/P5y7p+iG1GvGY8nRpTLW9DHr9SJFuorIbuPgIgPMganQ5Tr+IZywE9mUFRvse00uW
	bLBplwKnktNH2ewuCTWFxFwXf10zkKbtQpfhUZg3zOTMh1mZKAakSnQiS9YxxStRkA2UR4Sm2uJ
	SXyExg4J84d3vpTOf4fipQl3VKAAFM6EIasIAz9ncISpzWKIME9jaLN6SVhFVBIkNIioJ814B8k
	wXWFIIcK7Mcw==
X-Received: by 2002:a17:90b:4b8b:b0:3a0:d7f2:5a58 with SMTP id 98e67ed59e1d1-3b3f590e309mr239059a91.3.1795028439553;
        Wed, 18 Nov 2026 11:00:39 -0800 (PST)
X-Received: by 2002:a17:90b:4b8b:b0:3a0:d7f2:5a58 with SMTP id 98e67ed59e1d1-3b3f590e309mr239032a91.3.1795028438824;
        Wed, 18 Nov 2026 11:00:38 -0800 (PST)
Received: from [10.81.91.45] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3d56c9c2csm2440294a91.3.2026.11.18.11.00.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 11:00:38 -0800 (PST)
Message-ID: <3b986680-b15f-41c5-a302-f089a276488d@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 11:00:37 -0800
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
To: linux-wireless@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>
Cc: ath10k@lists.infradead.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, jjohnson@kernel.org
Subject: pull-request: ath-next-20261118
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDA3NSBTYWx0ZWRfX2pNdpqSROxe4
 ZnBmG+CEnwDwK4RlNleXdnNMzoKP6LMYEzxdb757l5ZCP9dmnB3SAxYbYBMdc20QCQKqWnNc2vU
 JN+LimnTN+ps4zbewB5qBWsFisjc/8WmkAcO+Omd/bHoV12V/EE0IB76qhDzdzolhutXyY1rmTe
 ca7wTCwU60ZnZBDeAUg+uu5D1FBEfZewaaJzdmYYER+kgX+aB0XU9BJwpolqAg+0a/hNAvrb63t
 rIEl5ghsWo+662TuclyRmDUfU8V6VVK51IqHnZI43OVThJd95ZW7cpH9fwypDnw0YSKPSzvnh+6
 i/iUzphEBp9FggNw0seXi21Fek6EZDcZ35NDtyrxxSyzqJPBy4bLUYozqzeM86p0q2bQyViGI39
 CVoGQnJoPnfOg14ThcfMI99JP7ohLd/cqq+VGarIEyWAybgv6EIXtmZXdistZO5733cqb5P+l3N
 uCLqB4GQuRok32IX2fA==
X-Authority-Analysis: v=2.4 cv=QO391QLL c=1 sm=1 tr=0 ts=6afdf5d8 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=qvpC8K6VnTLLHDY92LYA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: rmK5POqik1hkxocMF61JJPpeJZonRI_V
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDA3NSBTYWx0ZWRfX1cHOhUSIEY/L
 SGC5oA5hKx54tkUkFD1jhfq1E2WBfEL7a7tzd4AJ6UqDPImjnBPq+9Ueo6CVWfZg2jeUySkhQHh
 +bSut12BwLMNd6PhwZ6mvvkIAMJRoH8=
X-Proofpoint-GUID: rmK5POqik1hkxocMF61JJPpeJZonRI_V
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_05,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 bulkscore=0 clxscore=1015
 adultscore=0 lowpriorityscore=0 phishscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180075

The following changes since commit 2c50cd5d10e8723797f28c7978f1f61688e0c0d2:

  wifi: cfg80211/mac80211: apply HE OBSS PD settings on beacon update (2026-10-26 12:38:14 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git tags/ath-next-20261118

for you to fetch changes up to 1983b40acfcb3c3464b291c85977290a785bcfdc:

  .mailmap: Add entry for Vignesh Viswanathan (2026-11-18 08:57:26 -0800)

----------------------------------------------------------------
ath.git patches for v7.5 (PR #1)

A lot of assorted cleanups and bug fixes spread across the ath family of
Wi-Fi drivers. Items of note include...

ath9k:
Multiple fixes for the AR9271 USB driver.

ath10k:
Add Loic Poulain as maintainer.
Add experimental support for USB-attached QCA9377-7.

ath12k:
Add support for QCN6432.
Resolve differences in firmware link ID handling.

.mailmap:
Redirect e-mail away from disabled quic_*@quicinc.com mailboxes.

----------------------------------------------------------------
Aaradhana Sahu (10):
      dt-bindings: net: wireless: Add QCN6432
      wifi: ath12k: Refactor PCI operations and MSI config structure
      wifi: ath12k: move multi MSI vector flag to ath12k_dev_flags
      wifi: ath12k: Add hybrid_bus_type in ath12k_hw_params
      wifi: ath12k: add support for unified data-region memory allocation
      wifi: ath12k: move MSI config to pci.c
      wifi: ath12k: Add platform MSI support for CE
      wifi: ath12k: use CMEM write for PPT on hybrid bus devices
      wifi: ath12k: Resolve userPD ID per device
      wifi: ath12k: Add QCN6432 AHB support

Aishwarya R (3):
      wifi: ath12k: store station pointer only in dp_peer
      wifi: ath12k: move is_authorized flag to ath12k_sta
      wifi: ath12k: remove duplicate ucast_ra_only assignment in dp_peer_create

Arnd Bergmann (2):
      wifi: ath12k: fix QCOM_RPROC_COMMON dependency
      wifi: ath12k: add GENERIC_MSI_IRQ dependency

Baochen Qiang (11):
      wifi: ath12k: fix potential OOB access due to unverified hardware link id
      wifi: ath12k: skip hw link id match for devices without hw link id support
      wifi: ath12k: rename ath12k_dp_peer::hw_links to link_id_map
      wifi: ath12k: rename ath12k_dp_link_peer::hw_link_id to drv_link_id
      wifi: ath12k: rename ath12k_skb_rxcb::hw_link_id to drv_link_id
      wifi: ath12k: derive device id without drv_link_id for single device group
      wifi: ath12k: add support for HTT_T2H_MSG_TYPE_PEER_EXTENDED event
      wifi: ath12k: allocate logical link id on host when firmware does not report it
      wifi: ath12k: derive REO RX drv_link_id per device via HAL ops
      wifi: ath12k: derive WBM RX drv_link_id per device via HAL ops
      wifi: ath12k: use link_id_map to resolve RX link id for all devices

Chunkai Deng (1):
      mailmap: add entry for Chunkai Deng

Ernest Van Hoecke (1):
      dt-bindings: wireless: ath12k: allow calibration variant for WCN7850

Gaole Zhang (1):
      wifi: ath12k: Add EHT capabilities to scan probe frame

Guangshuo Li (1):
      wifi: ath12k: Fix potential SRNG configuration leak on init failure

Harshitha Prem (1):
      .mailmap: add entry for Harshitha Prem

Jeff Johnson (2):
      wifi: ath10k: Add Loic Poulain as maintainer
      wifi: ath12k: use str_enable_disable() in mac.c

Jiale Yao (1):
      wifi: ath11k: Reject short management RX frames

Jie Gan (1):
      .mailmap: add entries for Jie Gan

Jie Zhang (1):
      mailmap: add entry for Jie Zhang

Jose Ignacio Tornos Martinez (1):
      wifi: ath12k: fix wrong register read for RU start index of 80_3 segment

Kang Yang (1):
      mailmap: add entry for Kang Yang

Karthikeyan Periyasamy (1):
      .mailmap: add entries for Karthikeyan Periyasamy

Krzysztof Kozlowski (1):
      wifi: ath10k: Drop unused qmi_elem_info arrays

Madhavan Ganesan (2):
      wifi: ath12k: rename m3_mem_region to ath12k_fw_mem_region
      wifi: ath12k: refactor m3 and aux_uc firmware memory handling

Michail Andreas Michalopoulos (2):
      wifi: ath9k: don't read past short WMI command responses
      wifi: ath9k: drop WMI command responses when no command is pending

Nerijus Bendžiūnas (8):
      wifi: ath9k: return an error from a failed multi-register read
      wifi: ath9k_htc: fix the byte count of a full RMW buffer flush
      wifi: ath9k_htc: refuse a command that fills whole USB packets
      wifi: ath9k: stop a failed register read from opening the RX filter
      wifi: ath9k: clear the PHY error filter when a spectral scan is disabled
      wifi: ath9k: count spectral samples in the driver's own RX stats
      wifi: ath9k_htc: pass CRC-tagged spectral samples to the FFT parser
      wifi: ath9k_htc: derive the PHY error filter bits from software state

P Praneesh (1):
      .mailmap: add entries for P Praneesh

Paulson Raja L (1):
      wifi: ath12k: Extend BA buffer size to 1024 for EHT capable links

Prashanth K (1):
      .mailmap: add entries for Prashanth K

Rameshkumar Sundaram (1):
      wifi: ath12k: Fix HE BA mode configuration for AP mode

Rosen Penev (2):
      wifi: ath11k: don't select ATH_COMMON
      wifi: ar5523: don't select ATH_COMMON

Sarika Sharma (1):
      .mailmap: add entry for Sarika Sharma

Sebastian Andrzej Siewior (1):
      wifi: wil6210: Replace %pK with %p

Shazad Hussain (1):
      .mailmap: add entries for Shazad Hussain

Sowmiya Sree Elavalagan (7):
      wifi: ath12k: Add hardware parameter for QCN6432
      wifi: ath12k: Add hardware ring mask for QCN6432
      wifi: ath12k: add hardware registers for QCN6432
      wifi: ath12k: Add hif operation support for QCN6432
      wifi: ath12k: Enable MSI interrupt support for DP interrupt
      wifi: ath12k: store and use MSI data per CE and DP interrupt group for QCN6432
      wifi: ath12k: Derive QMI service instance ID per protection domain

Sumit Kumar (1):
      mailmap: add entry for Sumit Kumar

Tamizh Chelvam Raja (1):
      .mailmap: add entries for Tamizh Chelvam Raja

Tomas Paukrt (1):
      wifi: ath10k: add hw_params for Atheros QCA9377-7

Uwe Kleine-König (1):
      wifi: ath10k: sdio: Use pm_sleep_ptr instead of #ifdef CONFIG_PM_SLEEP

Vignesh Viswanathan (1):
      .mailmap: Add entry for Vignesh Viswanathan

Wei Zhang (1):
      .mailmap: add entry for Wei Zhang

Wenmeng Liu (1):
      .mailmap: add entries for Wenmeng Liu

Yingying Tang (1):
      .mailmap: add entries for Yingying Tang

Yu Zhang(Yuriy) (1):
      .mailmap: add entry for Yu Zhang(Yuriy)

 .mailmap                                           |   22 +-
 .../bindings/net/wireless/qcom,ath12k.yaml         |    6 +
 .../bindings/net/wireless/qcom,qcn6432.yaml        |  149 +++
 MAINTAINERS                                        |    1 +
 drivers/net/wireless/ath/ar5523/Kconfig            |    1 -
 drivers/net/wireless/ath/ath.h                     |    2 +-
 drivers/net/wireless/ath/ath10k/core.c             |   42 +
 drivers/net/wireless/ath/ath10k/qmi_wlfw_v01.c     | 1137 ++------------------
 drivers/net/wireless/ath/ath10k/qmi_wlfw_v01.h     |  278 -----
 drivers/net/wireless/ath/ath10k/sdio.c             |   16 +-
 drivers/net/wireless/ath/ath11k/Kconfig            |    1 -
 drivers/net/wireless/ath/ath11k/wmi.c              |    3 +-
 drivers/net/wireless/ath/ath12k/Kconfig            |    2 +
 drivers/net/wireless/ath/ath12k/Makefile           |    2 +-
 drivers/net/wireless/ath/ath12k/ahb.c              |   54 +-
 drivers/net/wireless/ath/ath12k/ahb.h              |   10 +-
 drivers/net/wireless/ath/ath12k/ce.c               |    7 +-
 drivers/net/wireless/ath/ath12k/ce.h               |    6 +
 drivers/net/wireless/ath/ath12k/core.c             |   11 +-
 drivers/net/wireless/ath/ath12k/core.h             |   35 +-
 drivers/net/wireless/ath/ath12k/dp.c               |   57 +-
 drivers/net/wireless/ath/ath12k/dp.h               |    3 +-
 drivers/net/wireless/ath/ath12k/dp_cmn.h           |    3 +
 drivers/net/wireless/ath/ath12k/dp_htt.c           |   19 +-
 drivers/net/wireless/ath/ath12k/dp_htt.h           |   15 +
 drivers/net/wireless/ath/ath12k/dp_peer.c          |  186 +++-
 drivers/net/wireless/ath/ath12k/dp_peer.h          |   43 +-
 drivers/net/wireless/ath/ath12k/dp_rx.c            |   10 +-
 drivers/net/wireless/ath/ath12k/dp_rx.h            |   16 +-
 drivers/net/wireless/ath/ath12k/hal.c              |    6 +-
 drivers/net/wireless/ath/ath12k/hal.h              |    6 +-
 drivers/net/wireless/ath/ath12k/hif.h              |   30 +
 drivers/net/wireless/ath/ath12k/hw.h               |   30 +-
 drivers/net/wireless/ath/ath12k/mac.c              |  171 +--
 drivers/net/wireless/ath/ath12k/mhi.c              |    4 +-
 drivers/net/wireless/ath/ath12k/pci.c              |  111 +-
 drivers/net/wireless/ath/ath12k/pci.h              |   21 +-
 drivers/net/wireless/ath/ath12k/pcic.c             |  435 ++++++++
 drivers/net/wireless/ath/ath12k/pcic.h             |   24 +
 drivers/net/wireless/ath/ath12k/peer.c             |    2 -
 drivers/net/wireless/ath/ath12k/qmi.c              |  249 ++---
 drivers/net/wireless/ath/ath12k/qmi.h              |    7 +-
 drivers/net/wireless/ath/ath12k/reg.c              |    4 +
 drivers/net/wireless/ath/ath12k/wifi7/ahb.c        |   45 +-
 drivers/net/wireless/ath/ath12k/wifi7/dp_mon.c     |    4 +-
 drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c      |  112 +-
 drivers/net/wireless/ath/ath12k/wifi7/dp_rx.h      |    8 +-
 drivers/net/wireless/ath/ath12k/wifi7/dp_tx.c      |   15 +-
 drivers/net/wireless/ath/ath12k/wifi7/hal.c        |    7 +
 .../net/wireless/ath/ath12k/wifi7/hal_qcc2072.c    |    8 +-
 .../net/wireless/ath/ath12k/wifi7/hal_qcn9274.c    |  101 +-
 .../net/wireless/ath/ath12k/wifi7/hal_qcn9274.h    |    2 +-
 .../net/wireless/ath/ath12k/wifi7/hal_wcn7850.c    |   17 +-
 .../net/wireless/ath/ath12k/wifi7/hal_wcn7850.h    |    6 +-
 drivers/net/wireless/ath/ath12k/wifi7/hw.c         |  160 ++-
 drivers/net/wireless/ath/ath12k/wifi7/pci.c        |   22 +-
 drivers/net/wireless/ath/ath12k/wmi.c              |   50 +
 drivers/net/wireless/ath/ath12k/wmi.h              |   23 +
 drivers/net/wireless/ath/ath9k/ani.c               |    4 +-
 drivers/net/wireless/ath/ath9k/common-spectral.c   |   41 +-
 drivers/net/wireless/ath/ath9k/common-spectral.h   |   10 +-
 drivers/net/wireless/ath/ath9k/debug.c             |    3 +-
 drivers/net/wireless/ath/ath9k/eeprom.c            |   10 +-
 drivers/net/wireless/ath/ath9k/eeprom.h            |    2 +-
 drivers/net/wireless/ath/ath9k/eeprom_4k.c         |    4 +-
 drivers/net/wireless/ath/ath9k/eeprom_9287.c       |    7 +-
 drivers/net/wireless/ath/ath9k/eeprom_def.c        |    5 +-
 drivers/net/wireless/ath/ath9k/hif_usb.c           |    7 +
 drivers/net/wireless/ath/ath9k/htc_drv_debug.c     |    3 +-
 drivers/net/wireless/ath/ath9k/htc_drv_init.c      |    9 +-
 drivers/net/wireless/ath/ath9k/htc_drv_txrx.c      |   41 +-
 drivers/net/wireless/ath/ath9k/hw.c                |   46 +
 drivers/net/wireless/ath/ath9k/hw.h                |    2 +
 drivers/net/wireless/ath/ath9k/init.c              |    6 +-
 drivers/net/wireless/ath/ath9k/wmi.c               |   47 +-
 drivers/net/wireless/ath/ath9k/wmi.h               |    2 +-
 drivers/net/wireless/ath/wil6210/debugfs.c         |    2 +-
 77 files changed, 2218 insertions(+), 1850 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/net/wireless/qcom,qcn6432.yaml
 create mode 100644 drivers/net/wireless/ath/ath12k/pcic.c
 create mode 100644 drivers/net/wireless/ath/ath12k/pcic.h
