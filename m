Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794472345;
	b=caNcUqmcljEZjZLzkGyznb0Xw9e4JV/rM+qg7rdChwjV1nAgbTr4ga4um2QMb1PyYXjL
	 OQoXHhAJ008WbNDOZ7qeCJ9VbiKiOkMXo1I53ljK10Z3LnltLpDJXhHng/EUntBormDZK
	 aQRMRqbZrCSHTmAaywzTISh7kjU54cldxW9glUwIaWFi3bAnjLqcF/+RQcKuiN+EWVFNJ
	 M4TQ0SxOL4nojGoD2nt+pDNR5TIgeAOJAwDqPWmqBij1sAcOwPkqgavDwx7Zvek774VmO
	 /Ih7ZlNngYg4F0j5TiMwL+j15sQLi/dzCbmIC0tY3WDlNHI1M9dTXhdAPXux4A55HMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794472345;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=zEk/fVzROC4wD3xuMlUk2KD0H5ZpB6YjFyZz1YUQCNk=;
	b=wUS2Csvpu7DTFBJ5jGYWxOXiGhTcrtAwrIhXvDrlupb7Px33aRFRGBD27PSakzia3X2v
	 I1DdghrWQ3fwz+TGQ2pnfbdYj+s2O8OsmAplOnZbQYtEi/ebTgK7+jFqCfEEFhUIg/Hwh
	 VHXMHXfXtWGPBK7o4IpBT/gpwUjlvx2HFGuY6ITXlTY45KTSkk7t0wMtDPOkaIFfG7LlF
	 i7EuwvHR6rou6BXaoW6wRo0LkesLvDm3ZM9x5l6GDJqWxC4UJWLznzNbVF6qR9+c1PWhZ
	 Tg/3KsJH6WNAkAO+ykJAT4leSr0QPrUaVX6VgfhRQI2O9HCOwFsWuSAPsUC1oXIs2UA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GI91eWHa;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BOaPZ1jt;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64243606A8AF
	for <linux-wireless@vger.kernel.org>; Thu, 12 Nov 2026 08:32:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 64243606A8AF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GI91eWHa;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BOaPZ1jt
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC2aUbk1475355
	for <linux-wireless@vger.kernel.org>; Thu, 12 Nov 2026 08:32:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=zEk/fVzROC4wD3xuMlUk2K
	D0H5ZpB6YjFyZz1YUQCNk=; b=GI91eWHaywUHSEc94yy+dqeoBtOBuGh2mVA07q
	YlDeXRMP7F6rLdmOqWngdoPoKb/r3gE5nNUXYTKtkqWblHuvbAs8D//1f8EVuaCP
	PfamF0fioLvN+8Dqn25UZYJJX1hRsMWjUIM3CCld1wssHqpUbtFVsl6VEBExSdGy
	5Nwjgatmx/23rVgK+IpJkqUrjwwaJFCLfX1F+7zGRIg4Aw4DCMMN4Wnm2W5g7AYo
	D+hH87+nhiNdboFqeFb8d/w4RdT8X7NfpbPsbku7bQs3n5r5QopGSs2tgfNYVoCK
	Tyvi3UqQRjpoEZ/7OWZi2+ae1in3ACHscsawMoD4CFvOKkEA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvtymug28-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Thu, 12 Nov 2026 08:32:24 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3b0f667a666so5622610a91.2
        for <linux-wireless@vger.kernel.org>; Thu, 12 Nov 2026 00:32:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794472343; x=1795077143; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=zEk/fVzROC4wD3xuMlUk2KD0H5ZpB6YjFyZz1YUQCNk=;
        b=BOaPZ1jtfE7/aJ98tLecvPKO/emI99wL0vxZ4eWZ5KW+l78ioJaKMtpU2a5motAAg+
         myLKB+O6PiELawQkz3pMIvB0HO6BBoHTdeNgKCkTxmiSBGkJzq9egQh9rNqK2w1W/+2K
         H4R7SUTOPYv0RXNQCByf2QUVmsewbf2k+Ev6hofSz6yoVjQGwIl70JRNIBxCebXOFkmB
         A0KLDRAYoK8GT6DL2TKyaCD5hPl6I6uooqc/EjH8A3OBmbvv9q9egV//y/BXQRm9XXXN
         k3ZL3dIWLu1kcoa6HOef8tNUbgyinZHVS1djiXhUAjX6jmhzPlgoiun7xVg9rxAdryZ5
         eaCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794472343; x=1795077143;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=zEk/fVzROC4wD3xuMlUk2KD0H5ZpB6YjFyZz1YUQCNk=;
        b=cVNqhKO/iln0LS/XVddwPddySGgTCDu88/JyTCzG38tbU7Hfe9P73+ExMoFQFNg7fD
         gRbgz5aVggBixPHQS+JzCGAFUjWTtrKVvt+IjWel/hD1OXivUbkjy3x0oxrlTlzAGhbb
         5ufM1Kp3Bu27LHlbJiBF39BtH7kKwzyZKr7bmwauzNe9U0tDqUwut/lIuLv8kFGPgQ0M
         Fzo6C0m+nc212+Z2ng6G9KEdOD/0SH7VoMpYJtJESbgpX6lwBoRbfXPCCRDxYE7I3fOs
         NU/vfFojzNkQtJ6p250xYAhpKDgD9gUFhETWqockRG5bDJnFtmPY/ARVHxuzr4Wzk94d
         QvBA==
X-Gm-Message-State: APuU4Z8NrbAXGejzljUX+CEGp3iYh4Pg52VCfT9ACwibFYyEVzWEHPl8
	Wbpq+p3MhyTVXTUm9JVt6+3BiRFX9/mkuwG42GP3qdIkzWNha7svHZvFFQQFinytlLb2tJHbG9D
	ciREWN9slypFh+rfSo9apK9fhCkkH8USzVXlC2f8qY8ehbPoSk8+opofVC4V533SCJV2W4A==
X-Gm-Gg: AYBFou1W/43ARdIOIgvkIg8GKLjbdVel2HiFjs1ioQ5fV7yM6Y8kmwesXBQyfO4eU7/
	2cS5dnGu7XM6AWDto+0UjQbUPlcicegF1i1EVbDsb8/NMP0F7Gi2rSURv2F1gLxPouDvs6EisPl
	wJiCA+EDSqOTTiB7A3ICeQvXmI4pICoImKnqxXxuIoHiEhTNwYCSqsmPeTgCzv+VCOEqrFEP39P
	SV/4w4WKLyk+KZ97rklt1QPCEz9bEQ90jXF7U+wmEROtapm7081wYLZddxSZlq9UNfvVMxO1f9m
	hJ8ypAHLNgKWikbfl21j3PlgUsdH9B3yCEvyX8ciYvzxuCO8J/Q2TLBrzxxQr4ljK9mPSRZQIMv
	lRq3SfKYOIYZLgAXXkM6hxgS157Nuxp+2LDI1nUw0rjVzTahxpLw0VwzQvxxHRrPyf6M//RCvvg
	tjy9ultUMMsZ8nXwRV6V/nh6SBKUfzntQJcFTKHK8MvNpA2EZJl0YHHOTH8wqct0/sAb0GnzKu0
	g==
X-Received: by 2002:a17:90b:2f04:b0:3ad:c4e9:7beb with SMTP id 98e67ed59e1d1-3b182ee3b45mr4552166a91.43.1794472343076;
        Thu, 12 Nov 2026 00:32:23 -0800 (PST)
X-Received: by 2002:a17:90b:2f04:b0:3ad:c4e9:7beb with SMTP id 98e67ed59e1d1-3b182ee3b45mr4552128a91.43.1794472342533;
        Thu, 12 Nov 2026 00:32:22 -0800 (PST)
Received: from hu-madhgane-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197ce55c1sm3518029a91.3.2026.11.12.00.32.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 00:32:22 -0800 (PST)
From: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
Subject: [PATCH ath-next 00/15] wifi: ath12k: add initial Wi-Fi 8 support
 for QCN9575
Date: Thu, 12 Nov 2026 14:02:14 +0530
Message-Id: <20261112-wifi8_qcn9575_bringup-v1-0-3f30fbc2bb69@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAI559WoC/yWMQQ6CMBAAv0L2bBO3hhb9ijGklAWWw4ptURLC3
 yl4nExmVogUmCI8ihUCfTnyWzLgpQA/OOlJcZsZ9FUbRNTqxx1X9cfLvbRl3QSWfp6Us4ascXg
 zSJDbKVDHy/l9gkuDEloSvP4mzs1IPh1b2LYd5n0X2oMAAAA=
X-Change-ID: 20261112-wifi8_qcn9575_bringup-a76e76a1361e
To: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        ath12k@lists.infradead.org, linux-kernel@vger.kernel.org,
        llvm@lists.linux.dev,
        Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-GUID: PkjiyTRZzoR_Z8N2LjgjAZnYPg5yfdya
X-Proofpoint-ORIG-GUID: PkjiyTRZzoR_Z8N2LjgjAZnYPg5yfdya
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAzMyBTYWx0ZWRfX0fyWDRK6PZKT
 7p5xR3MJrnaDns/RkF9gNmD/odQLElIqKaHO9Vvi7jt/A+5MwcnkdKylW3VJED6Ab83C9dv5Lka
 Ab90Op/uxZTK1yB9Vv4m/UPoQNsPKvlxbT1e7N4kYhMLRpUdyyjORVe/46KhgFdWp/h3KxkszMB
 SgQ/Ez1oYloVUiEjEy4QHWy3sw68PWLattHBF8Xdi/Ozm7Q7/RcFGf7ckFqn9LUtb9+BEDaHCAT
 7ieX0ITLLV7l107VfHfpf+8zvShk3dI+PTEn8PLTYDp7N0XhrcsyGT65yVRqamWniM0MXDVL8zs
 Gmhlp1XcG3SGkhjg0WvZmSrWVJ/G0cMXUGoInMTxLP6/8aiyGS9J4PblQfTUhk5H6MfQII4aZyj
 BGdOT7xlCX80tcGTkWICTCHSjxZkUI9JnlV+0838HdcvgckZvXK8e6cQn9wKlzs2NoLOnylH9ct
 FBEjnnKWTFAIFsEPDDw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAzMyBTYWx0ZWRfX0IuWFQmlT6nX
 3Iqsujb+OLjw3P2VyAs26uKUEQO2IFEYNLT/CE7CD5225gt7GiF3nDxJNp4etWD17zpy8kqj3dQ
 gZv0YH2CwLiv4Ug4xy4cJ1evdHOlyI0=
X-Authority-Analysis: v=2.4 cv=Q4BHcI2a c=1 sm=1 tr=0 ts=6af57998 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=uhRKEIYKi0VZnCLPkisA:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 adultscore=0 suspectscore=0 clxscore=1015 bulkscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611120033

QCN9575 is a Wi-Fi 8 (802.11bn) PCIe target that represents a new
hardware family distinct from the existing Wi-Fi 7 devices (QCN9274,
IPQ5424). It supports 2.4 GHz, 5 GHz, and 6 GHz bands across upto two
radios.

This series adds the initial bring-up scaffolding needed to register
QCN9575 with the ath12k driver. No protocol-level 802.11bn features are
enabled yet; the goal is to establish a functional base with the new
ATH12K_DEVICE_FAMILY_WIFI8 family tag and a dedicated wifi8/ subdirectory
that follow-up series can build on.

Patch 1 moves the PCI window register constants from pci.c into
per-device structures, so Wi-Fi 7 and Wi-Fi 8 can each define
independent window layouts instead of sharing one fixed set of
constants.

Patches 2 and 3 extend the shared QMI layer: a larger WLAN config
message to describe the CE and service pipe count QCN9575 requires,
and support for downloading an extended firmware binary.

Patches 4 through 12 introduce the wifi8/ subdirectory with its own
Makefile, followed by the hardware scaffolding: hw_params, HAL
register table, HAL ops and descriptors, unified firmware image
support, MHI channel/event config, CE and service pipe map, WMI
resource config, and hw ops.

The final two patches integrate QCN9575 into the driver: a mac80211
ops skeleton is added and hooked in, and the series closes with the
Wi-Fi 8 PCI driver scaffolding. QCN9575's device ID is intentionally
left out of the PCI id table in this series, so the module builds and
links cleanly but no physical device can match and probe; the id
table entry lands in the follow-up CP/DP series once the device is
actually functional.

Each patch compiles and links cleanly on its own; where follow-up
patches fill in callbacks, stubs are used to keep the tree
bisect-safe.

This series has been boot-validated on internal firmware version
WLAN.WBO.1.0-01410-QCAHKSWPL_SILICONZ-1 together with the remaining
Wi-Fi 8 enablement patches (CP, DP setup, MAC datapath) that complete
device bring-up; those patches will be posted as a follow-up series.

In addition, each ath12k driver patch contains Tested-on: tags for
existing platforms where it was verified that there are no
regressions.

---
Madhavan Ganesan (15):
      dt-bindings: net: wireless: add ath12k wifi device QCN9575
      wifi: ath12k: refactor PCI window selection to per-device layout
      wifi: ath12k: add extended QMI WLAN cfg for CE and service pipes
      wifi: ath12k: add QMI support for extended firmware binary download
      wifi: ath12k: add Wi-Fi 8 directory and base module scaffolding
      wifi: ath12k: add initial Wi-Fi 8 hw params and init helper for QCN9575
      wifi: ath12k: add Wi-Fi 8 HAL register table and hal init hook for QCN9575
      wifi: ath12k: add Wi-Fi 8 HAL ops and descriptor definitions for QCN9575
      wifi: ath12k: add unified firmware image support for QCN9575
      wifi: ath12k: add Wi-Fi 8 MHI config for QCN9575
      wifi: ath12k: add Wi-Fi 8 CE config and service pipe map for QCN9575
      wifi: ath12k: add Wi-Fi 8 WMI init for QCN9575
      wifi: ath12k: add Wi-Fi 8 hw ops for QCN9575
      wifi: ath12k: add and hook Wi-Fi 8 mac80211 ops skeleton for QCN9575
      wifi: ath12k: add Wi-Fi 8 PCI driver scaffolding for QCN9575
 
 .../bindings/net/wireless/qcom,ath12k-wsi.yaml     |   9 +-
 drivers/net/wireless/ath/ath12k/Makefile           |   1 +
 drivers/net/wireless/ath/ath12k/ahb.h              |   6 +
 drivers/net/wireless/ath/ath12k/core.h             |   4 +
 drivers/net/wireless/ath/ath12k/fw.c               |   8 +
 drivers/net/wireless/ath/ath12k/fw.h               |   1 +
 drivers/net/wireless/ath/ath12k/hal.h              |  10 +
 drivers/net/wireless/ath/ath12k/htc.c              |  18 +-
 drivers/net/wireless/ath/ath12k/htc.h              |   8 +
 drivers/net/wireless/ath/ath12k/hw.h               |   5 +
 drivers/net/wireless/ath/ath12k/mhi.c              |   4 +-
 drivers/net/wireless/ath/ath12k/pci.c              |  46 +-
 drivers/net/wireless/ath/ath12k/pci.h              |  11 +-
 drivers/net/wireless/ath/ath12k/pcic.c             |  22 +-
 drivers/net/wireless/ath/ath12k/qmi.c              | 484 ++++++++++++++++++++-
 drivers/net/wireless/ath/ath12k/qmi.h              |  73 +++-
 drivers/net/wireless/ath/ath12k/wifi7/ahb.c        |   6 +
 drivers/net/wireless/ath/ath12k/wifi7/hal.h        |   9 -
 drivers/net/wireless/ath/ath12k/wifi7/hw.c         |  14 +
 drivers/net/wireless/ath/ath12k/wifi7/pci.c        |   4 +
 drivers/net/wireless/ath/ath12k/wifi7/pci.h        |   8 +
 drivers/net/wireless/ath/ath12k/wifi8/Makefile     |  10 +
 drivers/net/wireless/ath/ath12k/wifi8/ce.c         | 404 +++++++++++++++++
 drivers/net/wireless/ath/ath12k/wifi8/ce.h         |  13 +
 drivers/net/wireless/ath/ath12k/wifi8/core.c       |  31 ++
 drivers/net/wireless/ath/ath12k/wifi8/hal.c        | 434 ++++++++++++++++++
 drivers/net/wireless/ath/ath12k/wifi8/hal.h        | 171 ++++++++
 drivers/net/wireless/ath/ath12k/wifi8/hal_desc.h   |  88 ++++
 .../net/wireless/ath/ath12k/wifi8/hal_qcn9575.c    | 124 ++++++
 .../net/wireless/ath/ath12k/wifi8/hal_qcn9575.h    |  15 +
 drivers/net/wireless/ath/ath12k/wifi8/hw.c         | 250 +++++++++++
 drivers/net/wireless/ath/ath12k/wifi8/hw.h         |  14 +
 drivers/net/wireless/ath/ath12k/wifi8/mhi.c        |  70 +++
 drivers/net/wireless/ath/ath12k/wifi8/mhi.h        |  10 +
 drivers/net/wireless/ath/ath12k/wifi8/pci.c        | 105 +++++
 drivers/net/wireless/ath/ath12k/wifi8/pci.h        |  11 +
 drivers/net/wireless/ath/ath12k/wifi8/wmi.c        |  57 +++
 drivers/net/wireless/ath/ath12k/wifi8/wmi.h        |  13 +
 38 files changed, 2512 insertions(+), 59 deletions(-)
---
base-commit: 91d8a01977701d10b0037e4adfcec21d8dd6d48f
change-id: 20261112-wifi8_qcn9575_bringup-a76e76a1361e

