Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795027217;
	b=VHhoLOExrd9sbTYWIDayfkHxZPyY41g/E9G5OEeNan6VqQqIgyoeZ8oT0m9zAbAw4X0W
	 9vuy1j+8P0SuNfGGBK2m5TS3UWEQstIxn09dMahAA8EDhTf+YBQgQhStyEpKbGyffZQH/
	 EQy2k+EGW5ZJIcSB+GvsdIddcDxPdd5eGOCDf0z1/iE2pWFk8zde2T6R+/WURHewH4Vov
	 GeiLoBdKGIPU9l2ocxPeNt9O59BmKqedhX+sx2GrWCgDJ6dWYyrvkbAIQpxJpvK0ON6f7
	 B3RFC+iwOJadPTPIE67msxlAmbQOr9Epssgl3jogMGr3UD0Gj6fnqakCszQZycCy6gw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795027217;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:To:Cc:Subject:Content-Language:From:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=m5cQENhe23m5PgLRsf7Y2DPL3GNLV0D7Ho+s5GZmWxM=;
	b=HYgUAa4bJEm2HsCLmwQJQoIBwKWEHQ37lO4tbOzUH4Qi9hvURg2nTxbV01uJu9be6VKJ
	 3VoThpMvWa51gpEJ68yMKUQndj0T3J3YQxQgYgRJKcLEj0KWYg/teYeU48zCoUroC/iMr
	 ytbCTX48TM+kkFwwL4VbLyeRi6DGOQJkGUO79sXZ4PiqdEBrk2xt+5ws7ZiY7XzN/esW2
	 DmmtKNGoUA9RRUJJLgALNT/+luufjEKBiVQRB6YfEfFgYU60nKHMWCQha8l4y1xCR8jyk
	 LprfFFW2eodyBbo9Ju6mPlrHyc47hDE0h/9lLhS6Jn9b1+zkK5i8JmlWVxy96uieuFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VGlKndFc;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jFSXHh+j;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38285606A33B
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 18:40:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38285606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VGlKndFc;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jFSXHh+j
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AIHGcF41843835
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 18:40:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=m5cQENhe23m5PgLRsf7Y2D
	PL3GNLV0D7Ho+s5GZmWxM=; b=VGlKndFcWhJ2ohpvncpq2aeIaMNAUK4KBlYATV
	E33UHXxtn6JRnIFvvJeXCOKDy8RgKpPrXTb5mfcQFp7/oiS5LE+Sb0LCioFzLVFz
	XIbeUd4KhOXJHwJ4O5k6qv9ZZ1Bef+GcW4EZAAejgXZ/6Nza79lW/Hm6XnJvl3yT
	v5WVcNeaLp4uUg3kOS5EfvyfUkZnBK8brF1QHXAUyhD6XE9ykXaEwjz8UjKJXoNh
	9BWwDb+Mujz+0yM7zCNxH226RwXTFCMBuUtcgB67u1E5e0AhVx4qx/U6Vfw5fjxh
	3kDur4CrBh6CRuZ50XGey+JRjGNtR6JxJIbW2XU6/2f0kmvA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1dnrs9uk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 18:40:15 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30bcb065bfdso1500492eec.0
        for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 10:40:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795027215; x=1795632015; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:from:content-language
         :subject:cc:to:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=m5cQENhe23m5PgLRsf7Y2DPL3GNLV0D7Ho+s5GZmWxM=;
        b=jFSXHh+jnx2nAnIee9tMab59w1KKAdPb1QsiZke51vaUsz5AK9/62q3nbIXORSqwAs
         g+i4GRh1jYEMzXF3SQ9pmElws929PIn5N7q/MpTAlVVcNR7d8c0YzjnYAmKtKzAQRqcC
         wJQ/qM9LIqnDs3ipbY9RY7TzRdvhwxzc7G3mYHN2h4AFlf91kxs/Q1BN33uOpjpWJMum
         mW+ZB/xlvr2F+DjKgVLsctFp0hVTN2mxZ8i9o+xCNtkBYGm1SkTZKdJoIQO0eoEQYoku
         wXIoA2LujXLxgpZioWjUgjLbKoXzJt4ne2M7G53YkSWF6d9w+WGcHNCDg1Rp1T5CEF0Q
         jKSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795027215; x=1795632015;
        h=content-transfer-encoding:content-type:from:content-language
         :subject:cc:to:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m5cQENhe23m5PgLRsf7Y2DPL3GNLV0D7Ho+s5GZmWxM=;
        b=ThOIGbSuP5LmpNEKEr7+Qevqr2U5mHJ8BqLwL28ln35VC2k6bqs1HTDlBaaJ6OJB2V
         ka5XpvQoM3NXFIi99YJZd7OC7C6A+A1DO/nyA4JhbJizF/XW48CSUAK+NKkumfd87JDN
         oVb4UdiF0EvxYjVKWhWgjzfEU5TTw1gdyBFNqx4Lm6m+CwORt5V0L3P5ahzQCzm3Byzk
         c9Fap+W/D59RSEyXCLFGHJYQS33vq4pMhbNsT3mZd6VlwGcpQYiAoJNE4RjVFCKqAUZ8
         sgLw1wp0hsJZ+JyjgGxUFXBgVXMkB2HA9AHuHKcFcznIB8r1Faq97fD/y0nxeLHbkqH3
         d8aA==
X-Gm-Message-State: APuU4Z/G7cabgi4x/unzR5BWevapBL8xVo2OpjM/YFPrlAPeEEG7ShWj
	mwjLDySp8gK8XnxymYFMkouwR0/WS+yCdIUSmQWwz5xZcVT3LMCz1oS3/0UC2lHPFh64NaY7F8f
	PTQYVzLyzcfL+EmIURwe7v2n/+rMgPRPMqmCjaDdyK1KpErgU7pp9BLa4oYsfmJaZpoJNzaZwkp
	r1Yg==
X-Gm-Gg: AYBFou2+ICng74oF/BIDjWdfUKFeCoIFWhQQ0RXPDM3p0pgcJvvdGFc/jIzIMg4FXRO
	uykefljKqmvdNXfHGmRaHXku3OUZuvf1SnrKI0xaWb64rpuO2Mgk20rw7o6dNDkZOA8EUoXaIEo
	k45c3Zm3AdL4U8QeicLOJ4I02L9t+pbacKhbJn3i4mQkdwjIrFb3GXuyiW3OPxMGPwKnESPXTQ9
	he9D3EvGwUE7wDosZzCCKc+lZnMhp+WLHbSfKINp7VkyGWnsu6coO2zbA1NR+fN/zWSriLGr8Ke
	NdWGpcv9h6fMaPEe5NWQUBzWgOIej49jjNV1NFT0R/PotEf+K4MxXp6SWcCW1rTdHVpCoSf1/ky
	uK/TRbkw6kJ2klUu0UqXJ/K1UDC2ne4uSLbnvbRQ/Ntq2rX1700Hqt3VBXx6tE7Mn9oEFoAoHdJ
	UTpdFxwGaP
X-Received: by 2002:a05:7022:f90c:b0:1b5:58e:b544 with SMTP id a92af1059eb24-1b543ce6b0dmr3050814c88.18.1795027214549;
        Wed, 18 Nov 2026 10:40:14 -0800 (PST)
X-Received: by 2002:a05:7022:f90c:b0:1b5:58e:b544 with SMTP id a92af1059eb24-1b543ce6b0dmr3050777c88.18.1795027213630;
        Wed, 18 Nov 2026 10:40:13 -0800 (PST)
Received: from [10.81.91.45] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5447811efsm8126886c88.3.2026.11.18.10.40.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 10:40:13 -0800 (PST)
Message-ID: <9f678c6c-6446-4651-94dc-ff3763b5dedb@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 10:40:12 -0800
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
Subject: pull-request: ath-current-20261116
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDA3NCBTYWx0ZWRfX4VNg/louaOSr
 ALaMrOhE9EElEe7T4wEHYGpnzY95gghJk8TKQT8ene7VhCBPfKDqDTO6/X+PmkynaSrCFiMKRNY
 tTfx+lU2IGBgb+IQe40dTIvSZtNx2Z5lZnAtU2vwmSNpxB4OHJB9oZtb9y5h0ghciIm7WOMLtpg
 NbcfejoZd+5fI5UtSTKiU1JUbbysmcuOn1ViYblgIIh8qd+UU/np+TEoIRcQC8GRC6CbVB3jk/0
 iPYsyV3vYCJN65tHOaDmHQS1QIQtbbGYayGOwoF5G4txHiAHP18KJIIjbAjwVUY1iZf7viXdzUA
 tRcima4SIX8JqMxwsd6TQ+HBsKoMhOL92viDrZMedRs2Um3ZrrJLRNqWJNIr7B68z9dDVL8pV7S
 2hmhsK4pIKLH7tyXdchDC37N8y/O+iaVD3/BKsuK4+DNRbIGR+2Z6hRb28b6DcCuoZEvYchkkrt
 oNH1Tj38jZJ3gXDhzOA==
X-Proofpoint-GUID: Par3qZZ8R7ZReNn5gfMvv6TBKlxBk6Oc
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDA3NCBTYWx0ZWRfX/p8Ea6sKkLHS
 aYq8S7NktF5gxXE30uFJ6Cjo3I44iJUb0yDm8bEEF6z/IBI+joJkAYr7+EG+y/aU2But8RJ+fJo
 s4UamY6SPP3SeUbomtHPEdo7lZHVHCA=
X-Proofpoint-ORIG-GUID: Par3qZZ8R7ZReNn5gfMvv6TBKlxBk6Oc
X-Authority-Analysis: v=2.4 cv=bfH+w+PB c=1 sm=1 tr=0 ts=6afdf110 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=XwkA41cYJLgbl9f4RuAA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_05,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 malwarescore=0 bulkscore=0
 spamscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180074

The following changes since commit cb1edd20907e13b058c0d5bd34c9d51b5bedc879:

  Merge tag 'nxpwifi-fixes-2026-11-03' of https://github.com/nxp-upstream/nxpwifi-next (2026-11-10 21:16:03 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git tags/ath-current-20261116

for you to fetch changes up to b1ed5a45b994a6473ca1cf34f35a1bf87f1d8e2a:

  Revert "wifi: ath10k: Stop unanswered temperature reads" (2026-11-14 08:13:06 -0800)

----------------------------------------------------------------
ath.git update for v7.4-rc4

Revert an ath10k change that landed in v7.4-rc3 since it has an unintended
side effect.

Also in ath10k, correctly report the status of bundled mgmt tx completions.

----------------------------------------------------------------

Thought I sent this immediately after I tagged it, but I guess not.

----------------------------------------------------------------

Jeff Johnson (1):
      Revert "wifi: ath10k: Stop unanswered temperature reads"

Shunsuke Nagashima (1):
      wifi: ath10k: fix status of bundled mgmt tx completions

 drivers/net/wireless/ath/ath10k/core.c    | 1 -
 drivers/net/wireless/ath/ath10k/thermal.c | 9 +--------
 drivers/net/wireless/ath/ath10k/thermal.h | 2 --
 drivers/net/wireless/ath/ath10k/wmi.c     | 2 +-
 4 files changed, 2 insertions(+), 12 deletions(-)
