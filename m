Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795437892;
	b=Vaq3g4FajPfYRnJid8iodM5fQS9LMAduTCtyySN3SV3LuMcE/8QkrfafOx0uAJU7nNmD
	 xlC6MFXrRiADHOLq1qWlzqsm6K/g4oGCekOFJZmorYCLKPIL3Xi8IUGmLoFOyIrdm+cJt
	 QgQHbhRhqGqnWASMv/BqGSMlaow0WBLUQBMwMQYEkuwEg3fvwbt+khja8bx5NofF6vrSL
	 flNlHIoWEkOUgzwGt0C0BEBIB0ucb8hlZGvW9Fg96r29YcMQI9FY1+EPe/vC/duG9EVX0
	 JAB7bzMsKscvx3vXCWnCyt4r350oxIlZjJ1255YyqaT89aJNMARTIlSPX1Ym4BgEewA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795437892;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=UXlVpOLiSO5S62UBB5qFydN/m7fwmuZwW+kaCTezLoc=;
	b=n4p2zX2m4IxCht1AbgOyCK+GnK7mF1xexaNnAn2iv4mo0H6b9s4j/QbewN55+cUZRSS/
	 6sOKuF1uECjsLNolrMUiyK19rXMEekIH8IoSCu6IooBsLV2bMCOR40ALLJNs2Aoi+cj09
	 RfVvOLUG/KXfstIsAMy8jDLO8AYfmGt/Jm4zyPbkLtnwW3W+Ni2fbfZZ03hNDHLmA6cTF
	 thjeMrUJOxt32PLVY4961R9aQyhgohJ1mlevour6J0w9g9CyOkTkHohFZxR00kFMS5877
	 VyW9U3Vn6E+DzCP7w0Ja6QDMvI/XRFV5FDUNmcVtjVANzN60PuXKU4duizeLkjPyiDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=b1miocEQ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bYwdmFKP;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AFA9606A31F
	for <linux-wireless@vger.kernel.org>; Mon, 23 Nov 2026 12:44:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9AFA9606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=b1miocEQ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bYwdmFKP
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANCFv0s3186034
	for <linux-wireless@vger.kernel.org>; Mon, 23 Nov 2026 12:44:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=UXlVpOLiSO5S62UBB5qFyd
	N/m7fwmuZwW+kaCTezLoc=; b=b1miocEQQqILL6Olob3/bgsy8jEJsnBMIlfLPs
	DW4MMqstjg81wlOiEXMcLAy4GgpbkiEj3A/lAmYp6qiXCaF03Dyr7dZFiZrpbHYQ
	pJVE1Hke4J36LvfLN9dsaDJMzcrp8egZzIKLa7wa/LZXm9oujA4Yfmua5Ih83ZNw
	jrXNv9Sly4xNUMAbaQKlxlSfp3mmLYEq1VEKSJobaqvFYSpj57i+m/6wRx2sWw5z
	kuyPrlpps3cO+u364j/NE+q/Yz8ooF7UnblCblcetN+jY6ffG0+dmSGSiaGuA9yD
	oIwS/cnfTZoStWKX9ee67C+TLKjgxFyxa6YiuJv7O4qea22w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4fyd1dms-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Mon, 23 Nov 2026 12:44:50 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-946038e22f5so669022985a.0
        for <linux-wireless@vger.kernel.org>; Mon, 23 Nov 2026 04:44:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795437890; x=1796042690; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=UXlVpOLiSO5S62UBB5qFydN/m7fwmuZwW+kaCTezLoc=;
        b=bYwdmFKPp+Hk0x8THolRMQpoGPMaCILA4iHXkFMckf7Gr+dyLV6sBtQgSkEX4GvO6G
         b04hcwAhHkCJYxEcgolnJF9NfVF2xh3x1nRFaTUOhqz5Je8Q1szBmN19Difqaz6+20yT
         jm8qBQbd5kKrTD8dNNMvBVn4gv5j53IeDhQ+i8x0YTZu5zs8bwg2stL0Yjcnt4oFR9R8
         JYlgbMyNfDu8MH02sFMP6UP51PwtSiwLkIuzbEJghZt+3sgmXXhl5IjedYlLp0aVzXnY
         oonQSM8gvf/WPWO8Kd9xq9xmU28glDZY4vBSE43ARrKWy/0xXJz8HJ0GBUrYhTzqES4w
         UoXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795437890; x=1796042690;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=UXlVpOLiSO5S62UBB5qFydN/m7fwmuZwW+kaCTezLoc=;
        b=THsm0md/m0BBg+AjhxIHx1kIw2OyRoAE8ep0qQ6GlXYaULBaO5L1QE3X+Hj5dGjTB3
         +M8GFfnEAFD3J/xKvJKx0IPOdTVu7U9UOT4ofcZDCSjpf67uLMtwADfq2iQZRxBJYUXp
         L2DytO6vVquwzwVc9dPipuKge16copV0OUl2HRgIldvspoq1kiv+eMjfW6YdnCdrh92g
         B1bz1o0bdZWacVpkqLH/+Zofq9/fxv35hmcGOeQu6ptwr7Rcgwi7NYb/iO8Y8Lj8q2mY
         CsbRPyWJy6soAD/w/6+C/R0TgGF6RV1KUbe2EnG1M6+WE9NczrJdIq/POV7WGQO+0TvG
         CpNA==
X-Forwarded-Encrypted: i=1; AL+hErGenaOxPdK+yZ5+daDR0AdBy/3PcrIHwFfIZonb9GkiB8tO8AvdTokmx943EuD0jGKwvH+d6Da1/5zzGnwNTQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z9TNry2zRQN/GBk+A8Hh0FBvD7f9l0KA/i44lCgW6JA6OhnZHwP
	UN8h7iD2PjGKRzypfmSejJZfYJwIv4YBRg+nYgVZQ0nndAl9Z50sEMSyvsE8kTCTmJJqdhzXWVC
	ef2Dp2lael9mJhPqVJ9U01PXgYOjmpVigKryzf0x/iivAlnJjdwRLGrObUuawpR5QVx21Nw==
X-Gm-Gg: AZFdTZff+SSivaR3gE/zembhs5CAyUIXPLsGIOT1NEk0EzdyK4r1AQKsWgqQHK/JpBY
	W5yUZ6nyJJImn6/JEkYal7N0//dOlmOELOoxT1hi0YsGiYpooHDEo/aauZR64UYDcGNqx2xEqLI
	btJN+j1dWuDhHw8l5TyrGKXlIzdOtn5rOkdS6k9NuAAF98kNJQfh4SY1KPjsNFhJBYtNYKkrlFn
	BHhYTe/3wZyb9CbD6tZXZBdFplFIwrbbg+S5e5BHo20F3EdRpfBGb79SKBEPGwZ8IqzpdMqRFLX
	QtQjNvBvLk3xJir1NaGN7fEjAsfH8f5Inf7Jy0M5+jNgk9+DJF/a3/SU2BdY954JXFeNpMG7kZN
	gPc+FZZAGQJjOJUnYcuo7wjHTZUJfVQJpKJUa5dMhLxKwyDqmASA64OGHurz2t7LOMaYsW/tfLM
	Ea0cvVPwp6HFQbMOFQ5XFVBjGXvy+XHyUHsuIv/ukH3kuL4fo1setdGUhBgxdqIDso6O1SPnge4
	cDkUsuFPuqbSMOAiVUwttCmphx0
X-Received: by 2002:a05:620a:4106:b0:949:61c5:73a5 with SMTP id af79cd13be357-949bab4dedemr1955823085a.59.1795437889710;
        Mon, 23 Nov 2026 04:44:49 -0800 (PST)
X-Received: by 2002:a05:620a:4106:b0:949:61c5:73a5 with SMTP id af79cd13be357-949bab4dedemr1955818885a.59.1795437889192;
        Mon, 23 Nov 2026 04:44:49 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:6c6b:1e5a:79dd:a527])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8538b09bsm649355875e9.4.2026.11.23.04.44.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 04:44:48 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH v13 0/2] Support for block device NVMEM providers
Date: Mon, 23 Nov 2026 13:44:43 +0100
Message-Id: <20261123-block-as-nvmem-v13-0-96ffe1f59332@oss.qualcomm.com>
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
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIADs1BGsC/3XSzU7DMAwH8FdBPdPJdr458R6IQ9o4rGJboYUKN
 O3dcXdppZBLJEfKL7HzvzYzTwPPzdPDtZl4GeZhvEiB6vGh6Y/x8sbtkGSjISALmnzbncb+vY1
 ze1nOfG51p8Cz71IMsZFDHxPn4ecuvrxKfRzmr3H6vV+w4LpbpRZsobUxkWJnMEB8Huf58PkdT
 /14Ph9kaVZxoU0x4AqFROkyOk7JoNJcUdSmWCjfokTxZD1mAzEqU1H0XgmFokXRxiGx7Yh6W1H
 MTkEqFCNKMAwy6pxzgIpidwqVb7GiZCCZSeqTtqmiuE1xgIXiRFGZPYHhDNFXFL9XVKH4tSMfW
 VGXex1qPx12ioJCCWtHjoIyHl3qckVB2BgPtowdrIlhE3xH0cjwas4WXwQ0pbPmN3sJbu909q4
 2YdwCjAjld+Oa4KwjRYkf/O/cbrc//KVE+rwDAAA=
X-Change-ID: 20260428-block-as-nvmem-4b308e8bda9a
To: Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Jens Axboe <axboe@kernel.dk>,
        Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson <jjohnson@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
        Simon Horman <horms@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Saravana Kannan <saravanak@kernel.org>,
        Christian Marangi <ansuelsmth@gmail.com>,
        Eric Dumazet <edumazet@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Eric Dumazet <edumazet@kernel.org>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-block@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, linux-bluetooth@vger.kernel.org,
        netdev@vger.kernel.org, daniel@makrotopia.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Christoph Hellwig <hch@lst.de>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: 766eYMumvJpGPSeg4IrPOSMEA29hJqJq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA1MCBTYWx0ZWRfX8MUqJTjyQQk7
 heD2Lg5aoJL8ZviFQdLsBwNiDHpktersqlzmozBFbytshgX4mmfZkVXBBXmvLKVp+aYLHs3fUag
 vpJ8JNTHy1XtePu21W98+stpqAqw718NXGM89au1dFf7rspgs0Yxvi9cyySdugjKYYvXzxhvv71
 Hsf9uQ8O/ZA+FWGPsST1AFgY7xv6l27GmT23adwX6dDfaVWUdsZygaewtL+Fy9BizkTSbk5BxoG
 DLtDVj4Gug0p3TgUi+K2JnG3T6xBhxoDXMsBkXyGvquw/n/+jWO9o0qPn0apcD+PnL86JSXtZTE
 Wu6Y4IMXD7nhoaDN1Z1RPflE17K7tmJvQkROmnQ58nwMHH/tIq1srDckQtl7xiBeP1x/sA0yXkN
 NAdBQx1AQsVxiO8QsM4S2RBKyS647PNJRKy1r8inJIVwB/KcY/Qy11fsvavHUpu6YDnxCxoT6tY
 v2rJZiqgdd6fK7S9XJA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA1MCBTYWx0ZWRfX1XojdK1Uv2bP
 YqpADNLECDv1gqgZgogsyLypJER7KghrNwALPRvdTNqFgJesyYB+Ig0UJwVRkoR5VRvzJJeXgyo
 BOz5tRwUHxYfV4T6jJEToa8qt4g/Jts=
X-Proofpoint-GUID: 766eYMumvJpGPSeg4IrPOSMEA29hJqJq
X-Authority-Analysis: v=2.4 cv=Aol7T+9P c=1 sm=1 tr=0 ts=6b043542 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=VT4XjZGOAAAA:8 a=EUspDBNiAAAA:8 a=AqFB1GJ6SRIpTNvHVg0A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=6CpsfURP9XNmmWg3j1mJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 spamscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230050

On embedded devices, it is common for factory provisioning to store
device-specific information, such as Ethernet or WiFi MAC addresses,
in a dedicated area of an eMMC partition. This avoids the need for
and additional EEPROM/OTP and leverages the persistence of eMMC.

One example is the Arduino UNO-Q, where the WiFi MAC address and the
Bluetooth Device address are stored in the eMMC Boot1 partition.

Until now, accessing this information required a custom bootloader
to read the data and inject it into the Device Tree before handing
control over to the kernel. This approach is fragile and leads to
device-specific workarounds.

Rather than adding a new NVMEM provider specifically to the eMMC
subsystem, the new support operates at the block layer, allowing any
block device to behave like other non-volatile memories such as EEPROM
or OTP.

This series builds on earlier work by Daniel Golle that enables block
devices to act as NVMEM providers:
https://lore.kernel.org/all/6061aa4201030b9bb2f8d03ef32a564fdb786ed1.1709667858.git.daniel@makrotopia.org/

Note that this is currently limited to MMC-backed block devices, as
only the MMC core associates a firmware node with the block device
(add_disk_fwnode). This can be easily extended in the future to
support additional block drivers.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
Changes in v13:
- block/blk-nvmem: defer the NVMEM registration and removal to an ordered
  workqueue, fixing the self-deadlock on disk->open_mutex when a layout
  driver reads the device from nvmem_register(), and the ABBA deadlock
  between disk->open_mutex and nvmem->srcu in nvmem_unregister() (sashiko)
- block/blk-nvmem: use bdev_fput() to yield the exclusive claim
  synchronously instead of deferring it through fput() (sashiko)
- block/blk-nvmem: sample the block device size when queuing the
  registration, so that the validated value is the one handed to the
  NVMEM core
- Link to v12: https://lore.kernel.org/r/20261102-block-as-nvmem-v12-0-f4a2a681087d@oss.qualcomm.com

Changes in v12:
- Simplify the series and remove consumer changes (BT/Net) that will be
  submitted separately.
- Link to v11: https://lore.kernel.org/r/20261015-block-as-nvmem-v11-0-f890ac74f87d@oss.qualcomm.com

Changes in v11:
- Rebase on linux-next + resend
- Link to v10: https://lore.kernel.org/r/20260806-block-as-nvmem-v10-0-be598b2a5606@oss.qualcomm.com

Changes in v10:
- block/blk-nvmem: simplify read error handling (Christoph)
- block/blk-nvmem: verify dev_t wasn't reassigned before reading (sashiko)
- block/blk-nvmem: drop __free() cleanup for explicit of_node_put() (Christoph)
- block/blk-nvmem: init static nvmem_config fields at declaration (Christoph)
- block/partitions/of: fix fwnode ref leak on skip/abort/error paths (sashiko)
- Link to v9: https://lore.kernel.org/r/20260730-block-as-nvmem-v9-0-f72935817dbf@oss.qualcomm.com

Changes in v9:
- Add nvmem support for partition blocks, not only disk (Christoph)
- Prevent concurrent exclusive access to the block device on read (Christoph)
- Add comment about nvmem being a side channel for block device access (Christoph)
- Link to v8: https://lore.kernel.org/r/20260703-block-as-nvmem-v8-0-98ae32bfc49a@oss.qualcomm.com

Changes in v8:
- block: Fix bdev->bd_nvmem on registering failure (sashiko)
- net: of_net: of_get_nvmem_eui48() now also rejects all-ones cells (sashiko)
- Bluetooth: mgmt: account for HCI_QUIRK_USE_BDADDR_NVMEM in
  is_configured() and get_missing_options() (sashiko)
- Reword blk-nvmem KCONFIG help text to satisfy checkpatch
- Link to v7: https://lore.kernel.org/r/20260701-block-as-nvmem-v7-0-3fe8205ef0a8@oss.qualcomm.com

Changes in v7:
- Rework bindings/dts so that the eMMC boot partition can be a nvmem fixed-layout
  and not a child of fixed-partition. (Rob)
- Add Support for fixed-layout as the nvmem device node itself
- Remove "block: partitions: of: Skip child nodes without reg property"
  This is no more required in this series and will be submitted separately (Rob)
- Add missing linux/cleanup.h and linux/device.h includes (Bartosz)
- simplify nvmem_register() error path using dev_err_probe() (Bartosz)
- nvmem_device forward declaration to blk_types.h (Bartosz)
- Add hci_dev_get_bd_addr_from_nvmem() kernel-doc for return value (Piotr)
- Link to v6: https://lore.kernel.org/r/20260629-block-as-nvmem-v6-0-f02513dcd46d@oss.qualcomm.com

Changes in v6:
- blk_nvmem_add() returns int, error properly propagated (Bartosz)
- Redundant if (bdev->bd_nvmem) guard removed in blk_nvmem_del() (Bartosz)
- Size guard changed from UINT_MAX → INT_MAX to avoid signed overflow in config.size (sashiko)
- BLK_OPEN_RESTRICT_WRITES removed from blk_nvmem_reg_read() (sashiko)
- Link to v5: https://lore.kernel.org/r/20260612-block-as-nvmem-v5-0-95e0b30fff90@oss.qualcomm.com

Changes in v5:
- Fixed ath10k binding issue + extended commit message (Krzysztof)
- Moved blk-nvmem handling to block core instead of a class_interface
  This allows correct/robust integration with block device life cycle (Bartosz).
- block: partitions: of: Skip child nodes without reg property (sashiko)
- Link to v4: https://lore.kernel.org/r/20260609-block-as-nvmem-v4-0-45712e6b22c6@oss.qualcomm.com

Changes in v4:
- Fix squash issue (dts commit incorrectly squashed) (Konrad)
- Use devres for nvmem resources (Bartosz)
- use __free() destructor helper when possible (Bartosz)
- Fix value return checking for bdev_file_open_by_dev
- Link to v3: https://lore.kernel.org/r/20260608-block-as-nvmem-v3-0-82681f50aa35@oss.qualcomm.com

Changes in v3:
- Fixed missing 'fixed-partitions' compatible in partition (Rob)
- Fixed clashing nvmem cells, document calibration along mac (Sashiko)
- Remove workaround to handle dangling nvmem references after
  unregistering, this is a generic nvmem framework issue handled
  in Bartosz's series:
   https://lore.kernel.org/all/20260429-nvmem-unbind-v3-0-2a694f95395b@oss.qualcomm.com/
- Validate mac (is_valid_ether_addr) before copying to output buffer
- Link to v2: https://lore.kernel.org/r/20260507-block-as-nvmem-v2-0-bf17edd5134e@oss.qualcomm.com

Changes in v2:
- Fix example nvmem-layout cells to use compatible = "mac-base"
- Squash WiFi MAC and Bluetooth BD address consumer patches into the nvmem layout patch
- Fix possible use-after-free in blk-nvmem: bnv (nvmem priv) linked to nvmem lifetime
- Simplify nvmem-cell-names from items: - const: to plain const:
- Factor out common NVMEM EUI-48 retrieval logic
- Reorder changes
- Link to v1: https://lore.kernel.org/r/20260428-block-as-nvmem-v1-0-6ad23e75190a@oss.qualcomm.com

---
Loic Poulain (2):
      block: partitions: of: Attach partition fwnode to the block device
      block: implement NVMEM provider

 block/Kconfig             |  11 +++
 block/Makefile            |   1 +
 block/blk-nvmem.c         | 197 ++++++++++++++++++++++++++++++++++++++++++++++
 block/blk.h               |   8 ++
 block/genhd.c             |   4 +
 block/partitions/check.h  |   1 +
 block/partitions/core.c   |  25 +++++-
 block/partitions/of.c     |   3 +
 include/linux/blk_types.h |   4 +
 9 files changed, 251 insertions(+), 3 deletions(-)
---
base-commit: 909ef7a9a30fa139e69e555e3606680f5cca7726
change-id: 20260428-block-as-nvmem-4b308e8bda9a

Best regards,
-- 
Loic Poulain <loic.poulain@oss.qualcomm.com>

