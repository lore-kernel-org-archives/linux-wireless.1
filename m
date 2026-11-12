Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794482800;
	b=e5XsffmorzmDvS/soiD3Bt8Zp3L0WIZNlemdT/KTkYEcAQzvK4LDfMaR5x3NVkxxt+Ok
	 tBfTivMJDx4mktzVwN8a8SX+DMPDBjOKI/uqCW2VwRq/69dug93/VSNhPxsRueMv6bq2Y
	 QlKcg8Xozd8jInsdfKq7xr6K38Ex4CAUK7JFibILeBJSqjdtjojpD4eFYeKjIsnn3sR3O
	 QB0Oi1ia3PFf/NWc9H4RQRU41cO8vjBA7oLDhLAPgeegliN7aFGpW5DfMx+bucc0XUu8s
	 y4pa/BgqJWOP29NduPG9Qc7A/LkmJes7hK/r1PPVxGCaUuH/fHNGuTQy+QypFdVDMBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794482800;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=1JcVWKFH2X/oVpXttXxWRBBtj9g+uFqqXhn+4yOKFNw=;
	b=LodXJ/DCUaL2/G0jkrMmhkKKZntkYubslJjA6WIAS5IFGyuAuvwQPvkCnhTyeJycfVyG
	 LP2CEW17ftp2nv+rwJyhgTEESbNQwoWJX0YX5dlCmEKi0WZLzyoDixOPPZabwgeU7Pmpv
	 EJJDkE4kPMS8x+UtReG2ldAxtV3ZX77s2pu5tURs6/mmMmz4qhUmc/drZuo0vVYGj0QGF
	 7DOQRaTKfE2w3csRGZDbxIx5qWA5dF3oLF08WQLzoHQKoFmVP4oVcXGcELiyC/9R2p7Qh
	 u5XMcwBoFD7jSIiMrlmlo+wLrTL1YCfGk/bvfnZ9u+4P3i5gC9mDsjP1F4zEWknVsiQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=A4RnNged;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MTmXBkxU;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F114B60A3833
	for <linux-wireless@vger.kernel.org>; Thu, 12 Nov 2026 11:26:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F114B60A3833
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=A4RnNged;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MTmXBkxU
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC5ndF6441529
	for <linux-wireless@vger.kernel.org>; Thu, 12 Nov 2026 11:26:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1JcVWKFH2X/oVpXttXxWRBBtj9g+uFqqXhn+4yOKFNw=; b=A4RnNgedtMnxsh1X
	sZ05vPE7I4lEMorZk2crxxQ9g+9pjjWqsSrNt/XBX1kFDUaOtdRDaw/N/yLvFMlT
	LNP+Pq66uh4PHllKGZJ/khPGQw8YFdgSRap46zvv22TJKGni44ICJ5OrrOFLAirT
	1ri9dcW0p8+f8HjiUeDlg7kI8njYuy77lLB+dEiZlGSu9KQc5NLpLVjUTWFT4cKC
	JrbmRQnQNTjKLSJMmgZ/ALieaEKdfGPY5WJ9upVmsNjzwbWYSNxFoo50r9f9HDA/
	RN/TbfHdZKd3nEJRtQFnNbmfQspONpeCWyUs093Xgc5HMkiyj+nCyNVpfPh2ABAO
	o8HEjQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hw7nc16y3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Thu, 12 Nov 2026 11:26:39 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36d1353fdcdso2419288eec.0
        for <linux-wireless@vger.kernel.org>; Thu, 12 Nov 2026 03:26:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794482799; x=1795087599; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1JcVWKFH2X/oVpXttXxWRBBtj9g+uFqqXhn+4yOKFNw=;
        b=MTmXBkxUbsLO9CbVfsYh3hD2zjHL6yeEc472jeYJMUkAlM6FLEK+6ZNi2Zt8eSvn34
         DPum7+8uSSNNG4u6C7MBsaWdUkWfyj4ltuDAc+yMj8ztVUuTYZ/1PpwTkmyE+NseV6RA
         waiyTqLvMXx7iiCloQl8jiboUSvWwfTAMOBngeesWCtifMPfNiWyYcnXp5oOTMLSlSP0
         T66RoifWiM+HB2jSJ2MgQj3Tq5C5toeSewizsdk8LDFTETDgkd1L+iP2qn7hcVD62TXx
         pQ8rhD4C1WUro6DG8S2OjeVlVgDT5RI33pIu3q7B7lkYoD6JuunJi7t2lJuKHQ/8Mxk0
         NxTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794482799; x=1795087599;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1JcVWKFH2X/oVpXttXxWRBBtj9g+uFqqXhn+4yOKFNw=;
        b=zdWlw74XlD73xovYKFc1OVnrT9JaPfFupoA/pwwFw+imDTMW1Lpeh4aS3Jz5K+9QRD
         H0Rbor5TzBcMkuSVNY50YSpdxrQTzUmftAnEND8Bj0mK/Eyu27rHvE0pboC6bJunY6Wn
         j8eRj74Pcr3TQKpFEJ28ODkUcFj5TBfbsLEeERjDI19JGmMEWN3alPJqDS9I8v0Is2U5
         I5OJb/D/p+KFVkTJXHggB8FtdargjszUl7KRZY7lMSMHBL9dGBXJUZ8aH4wc83a1xYnR
         a+id+UsEwUxbIMB708TftZvh71D5Pu8/YVF2+hYwO2v0u9V6n057TXZiHMKbp7RlyUZW
         kzIQ==
X-Forwarded-Encrypted: i=1; AL+hErEyIXF1Rn1yeXdCgp8qfXOlK07McnhJLS22xl2BJS8oGHErFWihb6xPlDxCEyQmzcHqBci6jBRZ1n3EThPvuw==@vger.kernel.org
X-Gm-Message-State: APuU4Z8FO1PCMXjHov0iFqqHjfkDSPLeVnU/staGzBie63cowQgzdkbd
	SNkULopf4tJRxL/Gvh1Z9HYbILMpSxlos6IQGxWOitvziL/O7iAy5x1HjxJPNz5bY1fxXFNe5nc
	M/6S+XTPH+96c/hxqhqTgBNOixIfRDyTMFm2kPfYD/+ryIDRGaNv26KX3YrvkpS4/DJs8QA==
X-Gm-Gg: AYBFou0Z9UOrwJT7SdEjvxLBy5hAjmqPPHXqn50VtTsQ5qvBjQR27S1VG12iONhLcl2
	OTGkyX3yryBswWv/sa1GqFr5qnYC+Rp5LA4ZHCcWEKBc1aOe9Fw1bbn0VVv+mmb10MGzX5i9GLQ
	fa4VT86tRhn8Ve82WwuTVlmAS93G1euwSx3HAlByks3fBexG7HOoRNKTPsBJKq8DVDCu2uQFVff
	A3tVkMTg4AOAfZw1RDPvtuaaR/n4Tou13bTWmU1LAF4I6wfGw/JEwUIIY/ZIzouB9qbOnweFilf
	blNCqygUW1ZFLXAvlZLv0eFgqrSmyamd/DAwuyvH6FNbSdz/tKDgHf7nZJSHLZ9MNw6y9RKBEj/
	rzhSYWtAsBCMdNFE22naqOZJfUAe9EwNqAPatIyHAY0B+8JNkiS/oHfsFYP18cjGH8pM75d1cRs
	7dcXf+YAYQ49SislcormOq6CD0
X-Received: by 2002:a05:7300:6919:b0:36d:2b50:4eb9 with SMTP id 5a478bee46e88-37685e6b287mr8016155eec.25.1794482798681;
        Thu, 12 Nov 2026 03:26:38 -0800 (PST)
X-Received: by 2002:a05:7300:6919:b0:36d:2b50:4eb9 with SMTP id 5a478bee46e88-37685e6b287mr8016127eec.25.1794482798228;
        Thu, 12 Nov 2026 03:26:38 -0800 (PST)
Received: from hu-kangyang-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520cfdfadsm30402359eec.19.2026.11.12.03.26.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 03:26:37 -0800 (PST)
From: Kang Yang <kang.yang@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 03:26:08 -0800
Subject: [PATCH ath-next v3 09/10] wifi: ath10k: reject scan requests while
 the device is not running
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
Message-Id: <20261112-10k-sdio-crash-v3-9-24f03f300bb2@oss.qualcomm.com>
References: <20261112-10k-sdio-crash-v3-0-24f03f300bb2@oss.qualcomm.com>
In-Reply-To: <20261112-10k-sdio-crash-v3-0-24f03f300bb2@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org, Kang Yang <kang.yang@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794482788; l=1796;
 i=kang.yang@oss.qualcomm.com; s=20260921; h=from:subject:message-id;
 bh=3OlAgrDUFHL3A+JcQy/qTiJndb2c3k6VOquH9i/CJ4c=;
 b=Xhxb4xKzf/WvcXjgs08OLZ5zCxODoNOwrJUny0plJjje3IwaChxj3eE5a7acIetTNb8+f/pFM
 yHZdOEwC+VRDzUOHUg1rO0sqUACq5N/BbJcJ1cPKenS17V7VN8ZzheS
X-Developer-Key: i=kang.yang@oss.qualcomm.com; a=ed25519;
 pk=qz684ZqyU2kfjPKl3UVYeUcHg1oCLfFIhi0n3vK+MFk=
X-Proofpoint-ORIG-GUID: vGkr13GDx8VSJmeQgto6oUmCCtL5r71X
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA0NSBTYWx0ZWRfXwU5Xkk2haQIH
 QPIMt/JMexNPBXERyXOERbjLNRW8EjQD+dsoxX0pIhuXuD28IMNCkwT9pcEaKekpFhdj/CTxhJA
 VsZ0Cb3TawCQXkrZ0LnpX6ygNKrxoT8=
X-Proofpoint-GUID: vGkr13GDx8VSJmeQgto6oUmCCtL5r71X
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA0NSBTYWx0ZWRfX86czhrsklm5H
 WN1fW5vLfb9JXIamVeDD2dIS8RnjwfwPdtFd5MwCJlrwcg+K64P4YVOM1dG4hn3ttmSRRWJrcQj
 N2x0agXUq1kHWbmxZXy7KTWkZIDFfLVgTntpFhEzTCaWVpHy0IT0ZBPLWKezTF5tgSf9eU5vag5
 e+9ssTrJw3nCOOHnEr0MZXlRnFAHoM3+AwqFA3EFDTfSvDq0CyPy3ODy2wNhcCzNKbG9z4d7e8d
 wAgevsx7FQftBvjbrllPggXwAJZwinyddDBsYVskKx8MX+tWFPsQP+x6D+5qX3HqZecWlUAYOgA
 zM02/7KjET9aevunvu5/bYshy9axFwiPpSVBTITuXk0BFvzU9oY+cjsqTcV8/pBx1/Y6T+Nq2BN
 kTApCkBe/YJucFiOvtcT1SY8brUSFiw0oqfDxA+LpTQeZRkalwv74pCBjCMobIPSU3n5sjlMHAg
 TPslt7BqHJlNL1st+MQ==
X-Authority-Analysis: v=2.4 cv=A8b5rKWG c=1 sm=1 tr=0 ts=6af5a26f cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=bVNB9YUvG8vYEfrUsegA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 spamscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120045

ath10k_core_restart() releases ar->conf_mutex after halting the
device, and ath10k_start() later takes it again while powering the
device back up. ath10k_hw_scan() does not check ar->state, so a scan
request may enter between these operations and be sent while the
device is powered down.

On SDIO, ath10k_wmi_cmd_send_nowait() queues the command on
ar_sdio->wr_async_work and returns success. The queued mailbox write
may then run while ath10k_start() is initializing the chip in BMI
mode, resulting in errors such as:

  failed to stop wmi scan: -108
  failed to start hw scan: -110
  failed to read from address 0x868: -110
  bmi communication timeout
  could not write board data (-110)

The BMI initialization then fails and the driver may enter the
WEDGED state.

Reject scan requests with -EBUSY unless the device is in
ATH10K_STATE_ON or ATH10K_STATE_RESTARTED, matching the state check
already used by ath10k_mac_op_set_antenna().

Tested-on: QCA6174 hw3.2 PCI WLAN.RM.4.4.1-00288-QCARMSWPZ-1
Tested-on: QCA6174 hw3.2 SDIO WLAN.RMH.4.4.1-00189

Signed-off-by: Kang Yang <kang.yang@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/mac.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 50eedc078c12..de466752f988 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -6416,6 +6416,12 @@ static int ath10k_hw_scan(struct ieee80211_hw *hw,
 
 	mutex_lock(&ar->conf_mutex);
 
+	if (ar->state != ATH10K_STATE_ON &&
+	    ar->state != ATH10K_STATE_RESTARTED) {
+		ret = -EBUSY;
+		goto exit;
+	}
+
 	if (ath10k_mac_tdls_vif_stations_count(hw, vif) > 0) {
 		ret = -EBUSY;
 		goto exit;

-- 
2.34.1

