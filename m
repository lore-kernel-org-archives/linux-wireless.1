Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795503478;
	b=n/dRq2qqEz7ZgJX2UbRCQhRHPohsbWUnA2T9mJtNEl0h+gw7Mle9diUCbUuV1WnOO9Hj
	 qhf9B/qMIZ9DpFXED3bEPdMee79yw0mVq86FWW3ZqMag+ayAHqaUSGZGiQX74oVk2qNz+
	 CHKN8AIVus9oqoRE9Kv98yK/rq3HWCfbgHckdqLs7gtOdgMIXXHh+DewzutyRfwc5oFQk
	 dGzPqCHdjKN5oSUMDPxlnrE+qJ3tT/q+sxQfUByB3cEnC359hYRMAQIZjbZ21S+xdg159
	 61s6t+8O0+x1ohmfET+JTN8/nemnoSFxHcECSph3gRXn9DHEp6p6WFQ19kagTGfKE2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795503478;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=O/0Ly68nj0LRGPali9lfccFxWZ3jqjed812YeNPK6Dg=;
	b=2phc2YKS2BvEpJc9CEX3SV1uokHYfuqedGgqs5m71ieudI85DNNfYQn8ECPPH/gkuBc3
	 4RbofcdRSNOzlzpcb1GbOlCyHfvykbOYwk7XeAFBWEHqEWoTv9IH7JhBRkrw/HWh4qfxx
	 u9SvwzqknLTFX98Od9aKqcz//1bufW7CeNbrh2PnTbmqHvpHYZNXaNaoMtViKO8nK6BEA
	 0YjeiksO8QkX7sckV8aUZ3ZUfzClswJDJJKnYErO0sxve7BsAs9XGRSU8GwoTViMp4MiC
	 nWwHHy9JY/vrOVxvQtLAF3Xjjsq+3RNs8dNw/FplMK4UjouHo8fDVssDLHlsOtefiGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jzyqnVzs;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DRrSQPhW;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9976D606A31E
	for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 06:57:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9976D606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jzyqnVzs;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DRrSQPhW
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AO2lglJ1598262
	for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 06:57:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=O/0Ly68nj0LRGPali9lfcc
	FxWZ3jqjed812YeNPK6Dg=; b=jzyqnVzsJhkJmzQ4FouAoJMoeBrcRvH/WBeaMv
	pvc8MYd/sCt5LgoO+LyGofONbuY6ylJ9WEqoIX80N4YS1vk/8eZnd+0r1ZP0Le2Z
	DhaU2MBzloL9pDPYMjEVLy5YT3vRt9II/tX8p5F+VzxxSVbJ9FJbpq5Fgs0JMb3J
	s02R+IMk3JAcKHh8T8QV2Z3rnhuXtmfqnvT29jZjqz5TpJbjhgT5uTp4JLDDbYMO
	5cLoiQ56Rw1uOOE4F8WUSj9bs/igj7PBgGIRxXgjz+jXmBIqn1yhPhKqIwQH08zE
	3nC5g9Z3eMTQxIY60VoNEDYWJehOMRreaP7GeF1PVKVYYshQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4ukqj7xd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 06:57:56 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3acc98e3b3cso3151116a91.3
        for <linux-wireless@vger.kernel.org>; Mon, 23 Nov 2026 22:57:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795503475; x=1796108275; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=O/0Ly68nj0LRGPali9lfccFxWZ3jqjed812YeNPK6Dg=;
        b=DRrSQPhWMRH0ueJ77CIEYKeemQYcAR18ZeYcS5Ob0poB61dbhdkQJyRo0eZm/DSUCE
         r7c9GJ63sfuYJJ+pV22CKMAOG8YDyh3vk0f9eVo2rkdEFzMr8FDFsaiwq4T9d+eJhxxQ
         OOWom7SKJILW1RegkYQK5GI1sOIfNFEzAZRADIY0W4V4+cQDU/M7vchcCmeeYVa6GDw8
         Y3J7vicy57ajKGxFujaaVLQoguGakuAkF+X3Jpfg6lRXEDhFTPAzrClZh0PEpQ3YM9sJ
         FjlJ/CsZLgvagDZyHpjuR1tV7PYuRnEtgnm9A6Id72pWeohC/QRfWrCSsV8zcLpqwxLx
         AYgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795503475; x=1796108275;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=O/0Ly68nj0LRGPali9lfccFxWZ3jqjed812YeNPK6Dg=;
        b=y/f3ifXgYv42+nX946xz+ShNrHSlZng6Tk7QDEHxet1bE9fC4CFZ0VLudO/XfD0ytx
         iCiy/rDi3LZ3qVwru/md+nkLL0lsWT4XJRYDv15Gie5ZBYfZFQ+AEvUIok2Puw7B0M/f
         1DW0VnJFSKo8CBoSbbZpdLVcbFftlKvYSPgQx32dX5JUqFTV37lME5cVSjL4hUHn9lFR
         snSo4PcaM4t27Q5bA81aSb+VwmUJr15XFEnQuhoZcIj3731M7Zyg6kIG03UN7tDpUThD
         gBkUVgExQWSaOh4gmPFSKUFdYeJt7YsXNEnUEXf5P9tsfXDsaWC38CVnZCRoC/hpBsB5
         9ZVw==
X-Forwarded-Encrypted: i=1; AL+hErHak4vPOKA/UvMqomoUW1npuH7Hp6CPJf7Je4UpMVaKkuFsp0xsbcSTZiVEpEtl4dOTOKYvhAGg7vTSnBgHQA==@vger.kernel.org
X-Gm-Message-State: APuU4Z9f2zWvakQvjSsvt7dzBIBPBC/iQlQNbyDeoIYru6vFr2vg01P0
	7ea0erZ1DrnTYpX41KqkNms5rISzxT7xirXpuQX+ounN5+oNW0OeCgBeyd0LLTJ2n+dNwgo80Mw
	OJMHtGnG7RVakzsdKvW5N+Pdw5nqJsVM9KkfPwLEEpBKf4kW6pfCdTdwej6BtDkK95ARFUQ==
X-Gm-Gg: AZFdTZfe/lDZkrM1fjdYwVmQZLoMCrUmNfLt4v7umAzTEYGR2XsyO+kgACKjv9GSXrY
	bprXyR0svCMaFFTFHrQ+59pnCH5l2PlnG7fpTYYyXN/+rQBnrVcIn9On8CDrEJ4IxQQDGnRF86u
	g2gDIpisYRJd1saI8xpsF/Mri0DYzaAiY23Ze0gwQbt2HPI76CwGmirpyYn2qAr3njAA/rYHF1o
	3DHiqZGZbJieK9BJWNZGEfLrYHViRW9TMSJix/pw1jGrL6kF2gUz+WiWCpIhAbQnxm3tYlgnz3w
	iKDKTHkAD4RITOCJ6zEWXiRgY7rU4zDUir2bGIv2fXth57EY2tstqPus9im6f4pi32/YTX3u9Y0
	751XtolisQs6C4ULrGX4AZrW1LHFI6r3zXv0umpO2H47Auv7T4sLOOfDFDXvaHPMqTRCZmTdReQ
	rpkkVtfJ4wxN2W1pbw74X6piQzsOrfHcgquc5R9kZHWJ6ooEMQQ333wpvnfX/ZhaOg+fhfpXsB
X-Received: by 2002:a17:90a:c10e:b0:3b4:928:dc45 with SMTP id 98e67ed59e1d1-3b41c8ff7ecmr12595874a91.16.1795503475267;
        Mon, 23 Nov 2026 22:57:55 -0800 (PST)
X-Received: by 2002:a17:90a:c10e:b0:3b4:928:dc45 with SMTP id 98e67ed59e1d1-3b41c8ff7ecmr12595851a91.16.1795503474598;
        Mon, 23 Nov 2026 22:57:54 -0800 (PST)
Received: from hu-aarasahu-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b40a878d50sm23819811a91.11.2026.11.23.22.57.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 22:57:54 -0800 (PST)
From: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
Subject: [PATCH ath-next 0/2] wifi: ath12k: Fix AHB IRQ error handling
Date: Tue, 24 Nov 2026 12:27:36 +0530
Message-Id: <20261124-handle-irq-retrieval-v1-0-e2403fac4e9f@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAGA1BWsC/yWM0QqDMAxFf0XyvMAaZCv+ythDrZlGpNvSKoL47
 2bz8ZzLuRtkVuEMTbWB8iJZ3snAXSqIQ0g9o3TGQFe6OUc1muwms/pF5WLtEib0RNz66O/kI1j
 6UX7J+r99QCgDJl4LPM8lz+3IsfxeYd8PlNGaP4IAAAA=
X-Change-ID: 20261124-handle-irq-retrieval-822eb8c8728c
To: Jeff Johnson <jjohnson@kernel.org>,
        P Praneesh <praneesh.p@oss.qualcomm.com>,
        Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>,
        Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
        Balamurugan S <quic_bselvara@quicinc.com>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Authority-Analysis: v=2.4 cv=Wu++otfv c=1 sm=1 tr=0 ts=6b053574 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=f6HrJeQhf4BwWiaRWL0A:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDAyNyBTYWx0ZWRfX2eL0Cygl9/Ea
 wDMbR7Grqe88h1CBFVsk131gKagGNxw7T2/TtajpeSzG6k/pPqTT7k1c+BibntfP83S5638sIWJ
 lzF36cxBkM1ZhVaGpUezci1/Wi2HaarebmoFQ44m/NikwFo33MnqxeCuzECls1bxU++p/E2MENe
 RJSjh98BboEuWPrLvnSAnCeUui0wztWycy4kOYqS0Gmgnah/aPlXgdq8U2tHaK2tElmUNJ7MN7x
 isyPTDO+6CA0HLyBtdVpTW7udzBF6OrS0Ifd2RINEM0ugCWpQBWF2CR/rn0xUpf5klBOVjnGQ+A
 60ZA4Ta6QhLu5d2YqTjSausSma2nzsz4AAviujArT9DkhU2OEYxx/elqwgMSlPfN3UekW3Sn1v6
 Mh6KyTgg76Of7No5gskxWNIdUY9F6qREZg2N6E3dDSLw3MAbqChUgzhcUyPG9wnLdRirIj1a0dC
 LsingHa1MsNSxVu1LqQ==
X-Proofpoint-GUID: Dlo5g4D8u_QqcM8VK5Hs_5mq0VGQUf__
X-Proofpoint-ORIG-GUID: Dlo5g4D8u_QqcM8VK5Hs_5mq0VGQUf__
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDAyNyBTYWx0ZWRfXyqcuA5iElC7H
 6Tz9KVfGCCuzE/vkfo+n2wAXDKJGxiLKNozfLNWKX7mPHJ/RRp28tiABF+rbjuNafpOOYbCMNK0
 VIQnMh1eBMH3sVYBipioY9HPbcJ2OJY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 impostorscore=0 spamscore=0 adultscore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240027

Handle error conditions in the AHB external IRQ configuration path.

The first patch checks for failures from platform_get_irq_byname() and
cleans up allocated NAPI instances and associated netdevs when IRQ
retrieval fails.

The second patch handles devm_request_irq() failures by clearing the
IRQ status flags and updating ab->irq_num[] only after a successful
IRQ request.

These changes improve error handling and ensure that IRQ configuration
failures do not leave stale IRQ status flags or an invalid IRQ number
in the driver.

---
Aaradhana Sahu (2):
      wifi: ath12k: Handle IRQ retrieval failures in AHB
      wifi: ath12k: ahb: Fix IRQ status flag cleanup
 
 drivers/net/wireless/ath/ath12k/ahb.c | 46 ++++++++++++++++++++++++++++++-----
 1 file changed, 40 insertions(+), 6 deletions(-)
---
base-commit: 03b7c601b6e314115015a57061f5b377afe13190
change-id: 20261124-handle-irq-retrieval-822eb8c8728c

