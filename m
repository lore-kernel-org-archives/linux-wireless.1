Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795658854;
	b=4n5CHrf+FrQ3QCazppksTRaGr/iaGJZcc6gBI4tSrCywSgpWqu76f3IAI6JKV81yL41o
	 R/gFAacqbIgQUehDo/lG7D7gBj6IUnuVsr9nhYpx6OsEsrb4I/KeiHywIGZ7Gog3VvTw+
	 LTLTMieiNIhGdm+6cKh65k3rOyGQZAx5+DQbJKA+VIJHUgOS+KmrRlQzAezxA1z5+jPqD
	 5rspkQ0EQ15/dh/Hw+OLoRSUX4+hcOstuc9ubR8zZWtJ3fI44gOJmYFNJO6ZcC2NQPuoi
	 53yvHJXYrYXXbE6RGXtndYLZDuz5RkZhNVlVsqTL4nkta4cP2LgeLXuGtvq82wMJauA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795658854;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ZmqZqvY75C/Qa9RTExYxl08ldl1aSuBOrCYiSbLV6r4=;
	b=Rjyg/Fe7Luzy0bMUJQRrzpSub4RjHM1oVRNMFmO9jPkEVAvxjr0Uh3AKHvxuQJ+1DqrX
	 VQlcKQOiE/ngvUlYlN1sQ4/ETxt30qJUBNgCBEclOrYOsaGrXypQm5v7SyxZaA+quDZVf
	 kfLqlC5yi7A3Y+Z7YhfgwsiBa01vGhIPqiTPezjYsYN7Z80l50rSFJxrqvDIKvhH9hbIk
	 QUzpfcjcQomiSvKk3wOg1zRascMoyXB1U6eFVu4Cju1ibPoZclYR+lugqLGn83760Z6rw
	 wbB7C8V9ENYECxe980p72szQvcqSXGmVwylttW48BqP2AxJXSja2PJCqj3s6wmi7SMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LovfT7uQ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HuFnxmFq;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73FA6606A321
	for <linux-wireless@vger.kernel.org>; Thu, 26 Nov 2026 02:07:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73FA6606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LovfT7uQ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HuFnxmFq
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6APJAlhq2028105
	for <linux-wireless@vger.kernel.org>; Thu, 26 Nov 2026 02:07:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=ZmqZqvY75C/Qa9RTExYxl08ldl1aSuBOrCY
	iSbLV6r4=; b=LovfT7uQsKT8VXLQAB0TvvzbY4t+NUadE6hcBMpPoukagIZ/z+V
	Fd6/aahUmozlYab/03LVqO1+4s6pSDFpOFxcu/9R1ycLiI5/ejPUxjqaBbt1fxW5
	7uwz92aqbCQecoakXhI6qvaOdtPsHgcEBRHfutd+Yzr+nepmLhtu2mnOmNHn91fB
	fmNmQ77uLKcp5S/PlCtj+e9mLex0dckMMBSDNQ95pdyZBsHN8hplCOqer9Cym4VE
	s89R55EFWBM3aZvymatPleqQET4Ovnxve5dkYx8lsuJKrfvEp04+/Sq6WN8Vj1EC
	/dq2dg+li+XlZIBG5XfdhPs4Hh0AjBnuhXw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j62vasuad-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Thu, 26 Nov 2026 02:07:33 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3b4232374d6so8696143a91.2
        for <linux-wireless@vger.kernel.org>; Wed, 25 Nov 2026 18:07:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795658853; x=1796263653; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZmqZqvY75C/Qa9RTExYxl08ldl1aSuBOrCYiSbLV6r4=;
        b=HuFnxmFq54994INOfQdCFTfYzeoPw9+QQ0Qr9Fifu9pCHmo6n7RUWhlmGZu+Nv5APG
         xeLeW28ZzddkFRMKpsP9yhPyuxuaoeUX0ho5gE6cMfTsNti/MVF0AXu47F3/2P5zEk/r
         t8SzbIt1ZvmT5CWAK8M3HR5kosWzcVV9YsUK/b3sh5+msxpCMVAgG+LTiZnjUAbiBfoy
         ccyyKS5Hv74VSWXb9g7X57of+d32ns66Avr0oQyy4AEA2OW3OqDpHNCd6CD7t9igpchS
         hgZlKwqFuW+69irMdYxgD1SG36Jz/sg4w1/vWu9Svy/dI8MikRIVQR3vE4lV8fQWM9Mb
         Cj3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795658853; x=1796263653;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZmqZqvY75C/Qa9RTExYxl08ldl1aSuBOrCYiSbLV6r4=;
        b=MwZn0pEfVE4YMC3Kxx55AQowCNetz3XsMDEfGszYBg/vKma/iyRN3vXeGc9vzXE7U8
         K9jtTp6UqUXOP0W4Tb+MdzsqAEHnUiPWv66Y9LMh5e+PsRYR0ZKLUczs+j7lW/9zzRhm
         AzsC8s6mjHQBN8AFK9qin0qxfwXeYs1Pji8uxnEpHZivCsditNb/uoKh6wxjdvwb735f
         N2fQot2LqjpqdAjLEt8FgaGAzp/zvKCBjYGbkDEsaFpXVzcT71RQ5iQ73Hs9WXvf3dhV
         Q3GD6E+2M5/r6kUeR3sBoZxg36jpJDqmaTGI7fuIzS/ZnyZME8inEJWrAJioJ93A5H2j
         8SOg==
X-Forwarded-Encrypted: i=1; AL+hErFbQijp3md++ItqdtQHIlI256FeOb3x68BZUItx8307ZMAA5YFm8AAJ886RZWs8LIqmu1U8EqOTbNqVq35ZEg==@vger.kernel.org
X-Gm-Message-State: APuU4Z8worcYiFXT00+fvyiF+5T2Y2sqMl/i472BDJKC+d2mxqEmpxfn
	psvKvUdZiFVWMGZ8Ey9Q2aZCVe81X7J5O9gjECXx2c/xZyEGM624uYpyfmGykrusub40fHqJXTn
	jIeR+H6IT4UNMpbsOvsRKu77A8LsohBiZtWPnIJ/gVqMUgojjZeEDsleWECj4TH9sDRePqQ==
X-Gm-Gg: AZFdTZfBZc57JVme/0VuVtJf2mtaUqsknZCh7KvgbjXtWxJaQg6iYhvSasp351VBCHB
	vvH79DMuJmtbXi9e46L1KqlyOfgL9U7b+M9Weot6iUZX/YemwchEzEDqHkYkoazSajQIoqS3QtA
	gWAzRHfhd1wj1dSmiC4pDCi4VnXoCXJ3HekkpjIUlBWk9i/TRLR+bYnzBN5OjC1YmUKLdceX26j
	y2EZKD5unC1TlVabbWc3TAGV4N2HpsKff/+rjCRpAraH8tqrk4KrWjkufwgXYKnFoeKjO9/hdVN
	La+ZPOz85F1LwAeJDywoajhkgyOJj7QYWwiepgg6qCNs+AzY1N41r6Pus0am/BHLahjfTSfkz9m
	sgmNoXImDRj/2ymzvUicifHl0EUXVkdxfiJv4AiUf8h2D802QVzPm6bTZnSpwGeOmOGg6f8qYNB
	uk7Qf8EWfwHGPs7uUzJjW4LTFS9KCI8ivBgMJw
X-Received: by 2002:a17:90b:2c87:b0:3ab:f2a9:cacd with SMTP id 98e67ed59e1d1-3b41c94df73mr19245897a91.49.1795658852762;
        Wed, 25 Nov 2026 18:07:32 -0800 (PST)
X-Received: by 2002:a17:90b:2c87:b0:3ab:f2a9:cacd with SMTP id 98e67ed59e1d1-3b41c94df73mr19245863a91.49.1795658852068;
        Wed, 25 Nov 2026 18:07:32 -0800 (PST)
Received: from hangtian-z2-2004.ap.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad0a34asm29626356a91.3.2026.11.25.18.07.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 18:07:31 -0800 (PST)
From: Hangtian Zhu <hangtian.zhu@oss.qualcomm.com>
To: jjohnson@kernel.org, baochen.qiang@oss.qualcomm.com,
        rameshkumar.sundaram@oss.qualcomm.com
Cc: ath12k@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-wireless@vger.kernel.org
Subject: [PATCH ath-next 0/6] wifi: ath12k: fix MLO capability advertisement and peer association
Date: Thu, 26 Nov 2026 10:07:21 +0800
Message-Id: <20261126020727.3273337-1-hangtian.zhu@oss.qualcomm.com>
X-Mailer: git-send-email 2.25.1
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAwNyBTYWx0ZWRfX9K7XDALneOGo
 chBMm1P7UHWbOIMT+RxuTLdggBAC5jwpwt2VvziyoNfKPcR36SLeeFLoJhisySAVZocY2/AFGLD
 WcatinqqHgaaJvVmktBZc0PrBY6E6ek=
X-Proofpoint-ORIG-GUID: Cqd8hl7y1Ug0wasVn0rFuZNo8VxCctrG
X-Proofpoint-GUID: Cqd8hl7y1Ug0wasVn0rFuZNo8VxCctrG
X-Authority-Analysis: v=2.4 cv=QZPzLcbv c=1 sm=1 tr=0 ts=6b079465 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=jwRwtn7Mt9YKnGwaeNoA:9
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAwNyBTYWx0ZWRfX7Db9d+NS/Idz
 +bsbISsFgm5cBbe9wsseVBmoyI3r6Q/q8o1Xz09xLX4oObJPPlkeP6lYbPzsSwapWYyUvp0f6gr
 1TU4B2haGDqWIThMo1VloyMUDZHr9HI+Cn9a8BF8Mw+j3F4bQ6bUq4mZEMk2HDXeSXNB3cgYdTm
 zhL0iHfqe3eQD2jj+JLP9VCHOWDIGWC3TeIqXtqkwF2XzCTLP20ilk+x7nH01ocCJKlk5If5OP9
 pppTYPCNyiaEIMXtRNyWkb+MensLjWtYQi3Hn99lviYdFzV3fDaeFJ/9ixk6dJQyeOeGTzRyivC
 qZVxxhcV3cRnI8XjVuVA6yGIDYvQVXNfksopFqIcuG1P7c1ryjeKsjzp7nU6/yv8ZIxar2tizhf
 L82raLI4QL1+0MG1NQCffCyVjxT0K4m1DBko/pvzO5BxmEFvCG+XPqTnNstZecEqpNO8K9yvX2e
 cB5sKVN47G2zIA+wYcA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_05,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 priorityscore=1501 lowpriorityscore=0 bulkscore=0 phishscore=0
 adultscore=0 malwarescore=0 impostorscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260007

Hi,

This series fixes ath12k MLO simultaneous-link capability advertisement
and populates the maximum and recommended simultaneous-link counts in
station-mode WMI peer association.

Firmware reports the maximum simultaneous-link count as raw N, while
the MLD Capabilities and Operations field advertises N-1. Normalize the
value during WMI service-ready capability parsing, then convert the
advertised value back to raw N when preparing peer association. For
infrastructure-focused chipsets, derive the advertised maximum from
the available radios rather than the firmware field.

The series also replaces the shared global iftype capability table with
per-wiphy storage, avoiding capability overwrites between hardware
instances. Initialize STA/AP entries from the normalized firmware
capabilities for MLO-capable hardware groups.

Use the AP recommendation already tracked in sta->ext_mld_capa_ops.
No mac80211 changes are needed. Recommendations are raw counts; values
0 (no recommendation), 1 (reserved), or above the local maximum fall
back to that maximum. In AP mode, leave the new peer-association fields
zero because the current station API does not expose the non-AP peer's
maximum simultaneous-link capability.

The series adds per-radio ath12k debugfs controls for the advertised
maximum simultaneous-link count and EMLSR support on MLO-capable hardware
groups. The mlo_max_simultaneous_links and eml_capa_present entries are
accessible under /sys/kernel/debug/ieee80211/phy0/ath12k/ through the
existing ath12k symlink. Writes from any radio update the shared per-wiphy
STA/AP capability entries. These allow validation of host-side capability
advertisement without firmware changes.

Series summary
Patch 1 normalizes firmware-reported maximum simultaneous links to N-1.
Patch 2 selects firmware-count conversion or radio-count derivation
according to hardware policy.
Patch 3 initializes STA/AP MLO iftype capabilities in per-wiphy storage.
Patch 4 fills station-mode WMI peer-association link counts using the
advertised local maximum and the existing AP recommendation.
Patch 5 adds debugfs control for the advertised simultaneous-link count.
Patch 6 adds debugfs control for advertised EMLSR support.

Thanks for the review.

Hangtian Zhu

Hangtian Zhu (6):
  wifi: ath12k: encode MLD max simultaneous links as N-1
  wifi: ath12k: derive MLD max simultaneous links by hw policy
  wifi: ath12k: initialize per-wiphy MLO iftype ext capabilities
  wifi: ath12k: fill MLO simultaneous-link fields in peer assoc WMI
  wifi: ath12k: add debugfs control for MLO simultaneous links
  wifi: ath12k: add debugfs control for EMLSR support advertisement

 drivers/net/wireless/ath/ath12k/core.h     |   4 +
 drivers/net/wireless/ath/ath12k/debugfs.c  | 168 +++++++++++++++++++++
 drivers/net/wireless/ath/ath12k/hw.h       |   1 +
 drivers/net/wireless/ath/ath12k/mac.c      |  57 ++++++-
 drivers/net/wireless/ath/ath12k/wifi7/hw.c |   7 +
 drivers/net/wireless/ath/ath12k/wmi.c      |  74 ++++++++-
 drivers/net/wireless/ath/ath12k/wmi.h      |   9 ++
 7 files changed, 312 insertions(+), 8 deletions(-)


base-commit: ff4c7359e310744a7abe53cf66d921fa2969eb19
-- 
2.25.1

