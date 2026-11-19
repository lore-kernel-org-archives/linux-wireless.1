Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795098229;
	b=QC+ZXdLTCX1v1CXZ1beVFSOaRvAydFxkAxOS5xShcjxMECM9raaCdpQygTgzSK3sE7Tq
	 ZQylX1+49t1vIOgt+5IqRGJ6jWrjLCu/7ptdxNWhnfziIeiAmYMQJZYJXblMZHu+/pdP3
	 GlhVDB1M+EsW8k+tF8G3dA6iFhshspM2D9IlMSzQ2un7sRM8RgSQez1y2zfgl1kjMKK+k
	 WSX+JnokbZsF6/R5K3YrI/lxZvt2r9HV+0ymg8t2Um4Zy3+xyUC2wabsLb9ZN1L30x2e1
	 nmn/DZ+DfxGC4/0tpKK7d2BJjnxQcQj8HTl5WWlgaO6TZeHsyZrEUDJODfKueBfaF+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795098229;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=t9bWB+Ike65eic+Yy4cT8z9+HxhXkL0til5+GubOeaM=;
	b=A2HWrbTGWwY7lc1ZmoM0aUBdmYKpSIJ1ADktyzZXfqeiMsakM9zDK9bdMs06cDl9yT+W
	 Yi/RXn5eY6ogo+0nICZaTMG48M9P1vd6vfPF2KCvaOYp6DIsdzNRFcWJUYAOb9CfnuaBa
	 1Ms1kHHp5/4Bozwkw2+rwfop6tpowrn17CfdBdLzrJeyBk9fvzVAnw0UyLY5i/8lFifc4
	 rdnQK9JsByDKcCVV0BYqRirQLvdYPBbHxj2bofPuqVPUXsQT4VCu+nolJ4ChvrlkYilnk
	 JhraUj0SoOJ2XVb6BpbegswkcUF604kb3ATkA7wirBySXtltVGQs3z6djIhr5Z+o55w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RakDrLwK;
	arc=none smtp.remote-ip=209.85.214.169
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 200CB606A324
	for <linux-wireless@vger.kernel.org>; Thu, 19 Nov 2026 14:23:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 200CB606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RakDrLwK
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2f01f296937so7957015ad.3
        for <linux-wireless@vger.kernel.org>; Thu, 19 Nov 2026 06:23:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795098228; x=1795703028; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=t9bWB+Ike65eic+Yy4cT8z9+HxhXkL0til5+GubOeaM=;
        b=RakDrLwKnpFkXQ5x53xU+/JtMeb5PKs/XkG/jGg4XUbPrV73tNZs5tZHokm+sjHSaD
         R53c42cI3ZAqLjcvQeKkxZnMlquo2wkjbjqxPk/+SGxCsClwm9WbYqtlckHmdAMLAW/W
         sCiIayoTguztq+/dzFAq47t/Wgeni9PqjkfBR/GKPGF1vnphVLQ9OSbymwte1rXoSaNM
         SoSH6cEG/+tzOQwWZDOZVZXJKYCAEGrndvMQdcryCRTXj0asVWvOO0gIYKrjdEZhARPY
         FJ5yFBp4vC7QWuTfm2RHldZSJvR1Eo78YqbRmFO191CVsS3RVXrql2nTN/cbG/6WKic9
         Sx7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795098228; x=1795703028;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t9bWB+Ike65eic+Yy4cT8z9+HxhXkL0til5+GubOeaM=;
        b=k+rpED+6CK6Em/9mSv1oaDOy3wWr7LYd9XsvDV8U5/z5QbNtj65HeueDIACj9VCK3l
         jR9fu/4CzUrkDVzzkpYVPpHyqId856ySYsG+GDJflQjx49Yif1S6Qy7USJjwIuYis7/k
         KJRqlIKCmloMNx8mqVQ5BKx18jJu9xRv0ZM/mD3lgY2JM3d54PJtyjFmmYE/JhDMLE/d
         hlxIOzELnySv+HMUBkc50Ccue0FtI7HgOUk8qRZgRHXO/U6a6ToTpdW9eGic6+4eCTRI
         CivqqwRhTifhlC6oY6IGGKo8rCVog5cxWenVAkK3sg7yJZxOOhwW3FiyycZdQJrNrzmT
         kR7A==
X-Forwarded-Encrypted: i=1; AL+hErGkyoLptP4waYpWlA/qiSLNaw5/DDFHs8BhL86X8QOA89d03t6d9y57Lml1cPbJDfSXJCOc+VHtol/311THUA==@vger.kernel.org
X-Gm-Message-State: APuU4Z+fEkHoFn4vYCy5a3owWxNlgQbobiIsKUSSoVKOuKF0IxhF7Ojx
	jF8jWsre0RBKN9M6S/Vum1p4bVYPVkCIDxCIndrFtD2I5T6aoKMbuTll
X-Gm-Gg: AZFdTZdhUk1MP4zuTW/xMysAOSuIUb5iJmm/r2vcP+4aElODvUK54LO0l8xnYnMR7yd
	5ICO/WR3aASiRJ3XsayahJMqnb8fhxNlTABNAhRw4T36eO9PpSz2akvQ5kvALmCq/R3smFy5DGG
	rsxmpgv/6M1HFj05ATTIhkEG8/JB0ohxtSmQIraZ4jrDyd9eB7acvl2f1cUoKSfQzxQOWAOTYaB
	GNue1RVqr24dAGWMbtH97lPewK/JR0+do8lNox/6mJcGOcn4QUQ+5r+tYwWPOdUWRkINq+kG83F
	tr434vQYZM3zCkXt3qxlldYwE9NWv4uaCk9SJz7lDf/LDY3oS6GsSByaRll5kgUNuWHS+m5AIMw
	2sbMOuXirqWHi0g/LPuMp/hvpmYS9IhDEQ2hIj5blNEYlDr7S/+g7J62+XBfIuEFvR4eYMaHTsu
	M33SQItzTxlubD7cn7ZQiY8+q6i8MnhvW/RoTr0JIwVD0Nq6twAYclILchPo30NLMZBurXmxtqV
	L/CKWdoPEOj6FWAA40LhPNmV3HOAgJ6jI5UaLB7rs/A93U6lJsbPYF5hyFYI80CCwq+vDPgk3J9
	rsuWVZ1qkpEIwrJ9FKMlSDwC3H+6oqfTqio=
X-Received: by 2002:a17:903:244f:b0:2ef:ee39:5dbb with SMTP id d9443c01a7336-2eff754e579mr60705635ad.61.1795098228295;
        Thu, 19 Nov 2026 06:23:48 -0800 (PST)
Received: from DESKTOP-NM9EKIA ([2001:e60:8509:ba6c:11e:f696:8454:757])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f10e67csm164415ad.53.2026.11.19.06.23.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 06:23:47 -0800 (PST)
From: Joonhoe Kim <26rote@gmail.com>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Jeff Johnson <jjohnson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-bluetooth@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org
Subject: Re: [PATCH RFC 4/5] wifi: ath12k: Support MAC address from the firmware node
Date: Thu, 19 Nov 2026 23:23:41 +0900
Message-ID: <20261119142342.2063-1-26rote@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
In-Reply-To: <20261014-b4-nvmem-efivar-v1-4-187c85f65018@oss.qualcomm.com>
References: <20261014-b4-nvmem-efivar-v1-0-187c85f65018@oss.qualcomm.com> <20261014-b4-nvmem-efivar-v1-4-187c85f65018@oss.qualcomm.com>
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Wed, 14 Oct 2026, Abel Vesa wrote:
> Read a MAC address from the device's firmware node (a DT "mac-address"/
> "local-mac-address" property, or an nvmem cell named "mac-address" via
> device_get_mac_address()), and use it in preference to the address from
> the firmware board data.

Another user for this: the Lenovo Y700 Gen 5 tablet (TB323FU,
Kaanapali) has a WCN7860 on PCIe, and its firmware reports a new
00:03:7f:xx:xx:xx address in the WMI ready event on every boot. Network
profiles bound to the permanent address stop matching after a restart.
The factory address is only in a file on the Android persist partition,
which the vendor stack passes to the firmware over QMI, and the
bootloader puts no address in the device tree. So on this board a fixed
local-mac-address is only good for testing; a per-device source would
still be needed.

I tested this patch on v7.3 with three changes for Sashiko's review [1]:
the return value of device_get_mac_address() decides whether the
address is used, the buffer is __aligned(2), and with more than one
radio SET_IEEE80211_PERM_ADDR() also takes the firmware node address
instead of ab->mac_addr. With local-mac-address in the wifi@0 node, the
permanent address came from it and Wi-Fi connected as before.

The cover letter says this patch is only an illustration. Do you plan
to send it on its own? If so, with those changes (and the comments
dropped as Paul asked), feel free to add:

Tested-by: Joonhoe Kim <26rote@gmail.com> # Lenovo Y700 Gen 5 (WCN7860)

qcom,ath12k.yaml has additionalProperties: false, so it would need to
allow nvmem-cells/nvmem-cell-names (as used in 5/5) and
local-mac-address/mac-address as well.

[1] https://lore.kernel.org/all/sashiko-outbox-171329@kernel.org/

Thanks,
Joonhoe Kim
