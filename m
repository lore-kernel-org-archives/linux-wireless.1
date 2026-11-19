Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795093056;
	b=Wm0WtuaEQC2j8gLDfPK2ymk5nvBVzhdFB+e0LgYKHafNU4B+hwNO0fSR8yDw0Ugth/ff
	 KLIYy+WPYUFaIwg3nvpVi49+9vMIEkWetankNRNjKgc92GNnAinNIKKmcd3F2lPdnsp0U
	 8hD4U/KE/9Np4W2lXxUuZ9wd5u6Z7tNkHIECpjaiqqLB+8t3Dd3F75X1AfzVENgNbV/ur
	 W8nw6EH8Q14/7BfpzE20fy9vKAmHanE1Af8DzthqZ4zO9BBU448TKJCx8DglBKmbW1KIP
	 JKBqEycW8ki6b2v0iWY/CYqX8RbKx2lOtEV7251KuSCiLr1kQ0aKP28LeOTbn4XbROg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795093056;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=BF8VzT/J2/iP+99+TvvpQdbS2N6QK+uOBFrf4qDPfF8=;
	b=3e+BGQwbzxvaPD1UCgs0hUFdcoU3Wx8tsdvHn+GuFGqUDjuUOncCjgLg8boUafId1Ikf
	 NrL6sodLrvO62YMkfJfM644T3wCEarRQ8I9N5N0wwLNQ2W+xyt9OZgZ9yW0kr4ZVZy+mE
	 UbUSrmmkynWn9zRp0wlGGjXiMgGCK2ZMSbuR1S/gn3SNu5tiZheXCp17tCpN6kyJ7LT9S
	 Ng/Qw7ILfdLFJqfJuZ8OCo4UYtFuvBAEIwsLguhTV0Y79PoeXyegXgjRnvy04yqdEccCW
	 o4fjzmc+tV8v/5fqEtT3hbtVKvZ84ttZzERPHLiMl73gC57ZaciVyR/OqE6ZgH6r8RA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fnOJOxjc;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AXjBDK6h;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB6C7606A330
	for <linux-wireless@vger.kernel.org>; Thu, 19 Nov 2026 12:57:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB6C7606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fnOJOxjc;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AXjBDK6h
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJBkKY52219562
	for <linux-wireless@vger.kernel.org>; Thu, 19 Nov 2026 12:57:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BF8VzT/J2/iP+99+TvvpQdbS2N6QK+uOBFrf4qDPfF8=; b=fnOJOxjcVJhPPc8X
	Tq1g+pIsA0wtmc0yQZgp+hJyTnaAjcvMFOlPWCQmFNS+YvR1W4YMTSSEdKAOjwF5
	vY1dJAWVXzi8WMUovDx3M13R9Xlc6+sUm1eKZYq4NjV0QKGWS0t6uhhZNMi7HXxS
	MecjPt1HkZbkTiJo0JG3sUv5Lxikt8M9mpu+p/KsDr2aKqZLl4wmpKA+Qqd1OzwE
	Sb9DJ0l4qQhtOzLWmOE3KIQs+7daAohIPeiE4nGyPLYImaFfquMhinR8q7JAgQI7
	0H0F+6wYjCna5DBYU+vGbaeNyHtTlrye4ngFKyr16yKtn1Pe7k9pJeEp5m5C1XVK
	EtfqWg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1uux9kuc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Thu, 19 Nov 2026 12:57:34 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-341eff9e381so3235870eec.1
        for <linux-wireless@vger.kernel.org>; Thu, 19 Nov 2026 04:57:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795093054; x=1795697854; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BF8VzT/J2/iP+99+TvvpQdbS2N6QK+uOBFrf4qDPfF8=;
        b=AXjBDK6hTUvghTEEQGJrAsk4s/imfT2vW562lvKKx+O4cdcjCiOnxpoPTv56fCjDNE
         9EbdqcXrz15uT1PWRAIjXT8xPKjCvQyc7D9mL/gi69zVJwFrwqunkzagTKDvxAT1OQQg
         f0mCSxWADBMzBiXJmuX7GNgAlNBvblCCr2/yrRo5HLNSnIx6Jw+Fl1DCLKuXl1v0rFzh
         DLO3CiQCsGuLq5sR+nm8hxPLsfnSFx0hNtkpCjW6t1z4ZZL3onziJh8c2qExyB9odiL1
         ftpTMv2EaCKIrU02guKcP0NAdeHH+YWFMgrp4Cn+dhqRlYWctoVXaNq4EdOZ8uqcO40e
         BDAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795093054; x=1795697854;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BF8VzT/J2/iP+99+TvvpQdbS2N6QK+uOBFrf4qDPfF8=;
        b=cX66gvt2bQaivPgHa9//1+bIf44S1pmPIF2CfK+Y3tPgdnnm9HqNREfZ/TR711LxIN
         N8CbHme/QnGzIikw/94XHNnkQT412anAgwGgzNxLaigiI6rT5AVhQcdxtdRCqQfGvGC8
         7Jk7ahSTGGh88mUOJwXqGRYJGx/GBcODyu1gGBb440Plqb1CZH6O/39cjgkiPMhly2KR
         4DWgbfMb/9yIMMr7uBWY9ulUtui4tKCBoSa/WyCR6P9WJuTRWF5v5ui3RSb7Kqv+gTtB
         efWRjnkDDDiFvGbJtdzU0s5glWosP5Y8ryByuyErV5TD9JrZ0/NA4NKaZL/ngGlETje2
         z2bQ==
X-Forwarded-Encrypted: i=1; AL+hErE2jh5avSmXi57xT5BJ25pRefBLnwWknKUJFJNheaFsaTQXgMSY8jPXxbW0HYcqsBeXbtcnHtlo3ivk9xV7Tg==@vger.kernel.org
X-Gm-Message-State: APuU4Z97b/7UBE4aWv0KTZza7kDqDdwWhv0qAst9bmuiBA7t7++ZUIl0
	aTRPul/bthuSfJvL1tPqEpjL6ymRA2zt7lS01Aq3xSbNNudCMgZfx+n45Y4VMZrAgFzVwWgpy4C
	90uxW1ym25VsKNZaHcj7ZUD7i1mXQXBjRkPGjxeL4Mnw6/+1ETW2AHuZqSvnXYlfE58V4dQ==
X-Gm-Gg: AZFdTZeH6z/X5k46On2Y0pLuD/9ISROXZIpNa2yKS0Zfc6XQSb4KdALwK3fEyZ77pDU
	Y5tsSWyoFfWOv3ooy7x7sjq+eK6tn1w/g05ykzYlWdMu5svvaFpW2rnfFZ4yR886DtDstpSlrzQ
	tUH6qdHburCnhVDDMtuucYWbGI4gCxHnuk1e4AtA6mJB+zyt7/xr6cQq0aoRLu5yz0HNC/SQ7gj
	1XuNsD977cNX2mdfCxeCos0SMOyXee+9KYzFzcHi1WLAktW0jt6Edrx0erjKcHmzD70V9/H1t2S
	VH8tW/RAXN+Op54NHMCQBc72ETFqKJB1wda0YB/gkrIuOmytW9peDiD+DuzIFRoaTlvzpRj91VI
	rlXAhsLTXElz9Y8ypKPvqqkN0LSiAzWdQp+7LhvWExldqAnkgBokgAbKcFvtUDdXFSKxfbC3haH
	4pmBbjKhaH
X-Received: by 2002:a05:7301:1502:b0:36e:a321:5353 with SMTP id 5a478bee46e88-3827dd05625mr4987978eec.2.1795093053763;
        Thu, 19 Nov 2026 04:57:33 -0800 (PST)
X-Received: by 2002:a05:7301:1502:b0:36e:a321:5353 with SMTP id 5a478bee46e88-3827dd05625mr4987957eec.2.1795093053264;
        Thu, 19 Nov 2026 04:57:33 -0800 (PST)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a7fbceffsm18529369eec.28.2026.11.19.04.57.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 04:57:32 -0800 (PST)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 19 Nov 2026 18:26:39 +0530
Subject: [PATCH v6 7/7] PCI: qcom: Enable ASPM disabling during link
 retraining
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
Message-Id: <20261119-bwscale-v6-7-9a9a715fcb46@oss.qualcomm.com>
References: <20261119-bwscale-v6-0-9a9a715fcb46@oss.qualcomm.com>
In-Reply-To: <20261119-bwscale-v6-0-9a9a715fcb46@oss.qualcomm.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Jingoo Han <jingoohan1@gmail.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Rob Herring <robh@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Manivannan Sadhasivam <mani@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, mhi@lists.linux.dev,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        qiang.yu@oss.qualcomm.com,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795093007; l=1086;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=dixWhgN1FcwflBXIi0Se/61aBMCRn0NVL4pFbQ5pD1M=;
 b=PUZk3GeenFpAL675pkSjVwlCW6zpIzwS6Gmvb7s0aa9docOEiXMtvktcnV9mru6evKsNiDilX
 wUhqKH8Hy86C6QnFabVSxqG6C4LbGY+SWRnz4vitzqM5gfjezA/UxS4
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-ORIG-GUID: YCejyyrEAtbLc1s6ZElve9s98jktdWZS
X-Proofpoint-GUID: YCejyyrEAtbLc1s6ZElve9s98jktdWZS
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDA1MSBTYWx0ZWRfX5goIje1yC2k/
 23p4LJJSClXM9GJHdxCFe+817YKAanxIF6y3g4HD6RJLRbTgwRNs4us9bxDE4Hwuv3UWs8NOmGw
 1sgifQHJc9TljBP0OY2tClYe9sCVk68=
X-Authority-Analysis: v=2.4 cv=Q89HcI2a c=1 sm=1 tr=0 ts=6afef23e cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=R7JsESPv6PNixK4vMH8A:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDA1MSBTYWx0ZWRfX5Rnkh5RuLGHN
 kLhTZI3M6XkkVGKXiuNgr9893iWLkw4DuXcd6QJo8uc26Sx2ELv9w+R2zoe9MzQL8duJjhcBzbn
 y8fJoi/DV/zOUijxEP0EOh6NAnIAegapfKUptzTqwKzyu8raSgaK1a8dz6EpdWk70SD07YqLHgc
 7eKBJUCrUO9wXBBc0M7RWHCpFLQP659shwWx4os/w3IX6DvGXhKBqpc7ETt+Hx820qOIBvG8qSX
 +etgSeuoqW6cek8BQX7MMpi1yxnNAL/miN6K/F/qDC/TOc3+WaRjj8KdlR8q495OD42yW2nFAri
 GQHHHmHcscn5oB+7ky2n+xbUVgspR++byVmcff9ECTKGs0kpR32/FWFbXqYus0vhUpqTDWHsG1B
 Y9IBb1VAnoZQ/PghYUJD8FPh+WUDVsGqDsWHC6sZRQ7MiMfTORavIQuM/CVt7pEDCdaSTm+oEKz
 tZ2MgXyywERDClQDDWg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_03,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611190051

Some Qualcomm PCIe controllers require ASPM to be disabled while the link
is being retrained, otherwise the link state transitions during bandwidth
scaling can fail. This is a controller requirement, not a device quirk.

Set the disable_aspm_for_retrain flag in qcom_pcie_host_init() so that
the PCI core disables ASPM around link retraining. Future targets fix
this in hardware and will not set the flag.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/pci/controller/dwc/pcie-qcom.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
index 9b113536a82b..473f2fce258a 100644
--- a/drivers/pci/controller/dwc/pcie-qcom.c
+++ b/drivers/pci/controller/dwc/pcie-qcom.c
@@ -1514,6 +1514,8 @@ static int qcom_pcie_host_init(struct dw_pcie_rp *pp)
 
 	qcom_pcie_perst_deassert(pcie);
 
+	pp->bridge->disable_aspm_for_retrain = true;
+
 	if (pcie->cfg->ops->config_sid) {
 		ret = pcie->cfg->ops->config_sid(pcie);
 		if (ret)

-- 
2.34.1

