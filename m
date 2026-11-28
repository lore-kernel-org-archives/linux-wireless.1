Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=79.135.106.99
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795886655;
	b=Yw6ERq3mbHf3Z6cgqHCMOVyalj5kuNoUEutRlwA9pYZruYXSfnNrIZKm5bXY7G4wfYb3
	 n7wze/YBBs577z7D8wxAcHw740aGBXCxFBOQ4/MK9HKU59dp2MwQCwL/4jYeyUAeYR6gy
	 GxehC699C0wJNsRVAPo9G5w14sg8/M55tgM3qPGXnZq9ZDtp88xmaeOWtY08vbxqS6blQ
	 OixfSCiTE16nkjEgUWlxPHU94EIZdUORrd277jSoP4phgfdmoDJvwRxzxtWTqE10qUFQn
	 zXovmP2R6tZR6lPJCpSgrl2ELhSJOO0UOwF0w1hGk2qIIMiC61GTrjvAH4m0t068mXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795886655;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 Feedback-ID:X-Pm-Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=4M4s9FaAHL9MRuVIk3QpPucCuF5Ws6xTP4IZaI5KZ+w=;
	b=DT1gTdGMezN8NIWGDv44pw125FHaoe15NlkKDau2SrbLZ3endDp7ZYOUeU6xM8iVZMP+
	 tocv5R0EwRybc4bMQ0DE73s7Tz0KNbKjWTbUrm4h23V9DH7hIghbQ1Aj8Zab7c84R8Nk7
	 HuaopERDMHwO1XXv0zOoCJpkC+K2F5wJ+nT0oYmZ5wwzXMuGFgzwKXXVU0m431MjDu2GR
	 Dwq521dAQ4nck/u8hYmtAOnGLpMUEq+xDYkZSLKDt3DgROHyAkiNV6QoEJIT3H9IhgSYj
	 ipTbCImuzDRpaX0BMEH23w+opfbGuEXffj5rIrLsjncQtCEhGnMkZKquZFxhQQ3WDrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=proton.me;
	spf=pass smtp.mailfrom=proton.me;
	dkim=pass header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=quWw3TBT;
	arc=none smtp.remote-ip=79.135.106.99
Received: from mail-10699.protonmail.ch (mail-10699.protonmail.ch [79.135.106.99])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAC90606A31C
	for <linux-wireless@vger.kernel.org>; Sat, 28 Nov 2026 17:24:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DAC90606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=quWw3TBT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail2; t=1795886652; x=1796145852;
	bh=4M4s9FaAHL9MRuVIk3QpPucCuF5Ws6xTP4IZaI5KZ+w=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=quWw3TBT8RLgdbZOOy8QIF/1iM0YPwuWwRMMQddMof0BcYEtexVc8vSc4GRL7DH9J
	 wpFj94GPP5/Ga9JwumahJewsDWr/auXFWmqZX6QoP4xx8qWo5bcpWcUZ27UGJDbxzn
	 TWfdx71lQYDbodbqkl3Nslwxalp2WdUvjR5JDWCQNBZkl1nM2cxoKMSkPugGEbPFnk
	 l/fH7RFk+w2StAR14jbNPT3+o4nORgVw7Pgm9VufYAwCs9OKqV5wYkbZqBPZUKduwI
	 U58Vi3dW2tSTFjJmFiBoEuw8/keSvJyhUhe7Cq9vaHadAICfa8GPRnWthrOa6jzbpY
	 BcySfwU5TmcnQ==
Date: Sat, 28 Nov 2026 17:24:09 +0000
To: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>
From: Janderland <janderland@proton.me>
Cc: "pkshih@realtek.com" <pkshih@realtek.com>
Subject: wifi: rtw89: 8852ce: firmware crash with v0.27.138.1
Message-ID: <aMbkCjwx2a_a2S2WTeeGSBqtBdcoMBQllfpHQHMj8uNfjhmnLdZWoK8cNQqvMtoOLaUmMfpfa7-kRZmlX7-oE1gF93yUNDgs6-QKPE2AVqM=@proton.me>
Feedback-ID: 103273240:user:proton
X-Pm-Message-ID: da0149a5dd9aacdfbd9def58c597de2f7009c85c
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


Hi,
After upgrading linux-firmware-realtek from 20261019 to 20261124 on
Arch Linux, my RTL8852CE (AzureWave subsystem) firmware crashes.

Kernel: 7.3.6-arch1-1
Bad firmware: v0.27.138.1
Good firmware: 0.27.129.4

Downgrading to 20261019 restores WiFi. It seems stable for more than 24 hou=
rs.

After the downgrade, the card was missing from the PCI bus until I fully re=
moved AC power.

Relevant dmesg:
[ =C2=A0903.528421] ieee80211 phy0: Hardware restart was requested
[ =C2=A0905.806121] rtw89_8852ce 0000:08:00.0: FW status =3D 0xcb001228
[ =C2=A0905.806131] rtw89_8852ce 0000:08:00.0: FW BADADDR =3D 0x0
[ =C2=A0905.806135] rtw89_8852ce 0000:08:00.0: FW EPC/RA =3D 0x20148bb2
[ =C2=A0905.806138] rtw89_8852ce 0000:08:00.0: FW MISC =3D 0x0
[ =C2=A0905.806141] rtw89_8852ce 0000:08:00.0: R_AX_HALT_C2H =3D 0x30000036
[ =C2=A0905.806144] rtw89_8852ce 0000:08:00.0: R_AX_HALT_C2H_CTRL =3D 0x0
[ =C2=A0905.806147] rtw89_8852ce 0000:08:00.0: R_AX_HALT_H2C =3D 0x0
[ =C2=A0905.806149] rtw89_8852ce 0000:08:00.0: R_AX_HALT_H2C_CTRL =3D 0x0
[ =C2=A0905.806152] rtw89_8852ce 0000:08:00.0: R_AX_SER_DBG_INFO =3D 0x0
[ =C2=A0905.806158] rtw89_8852ce 0000:08:00.0: [ERR]fw PC =3D 0x20150b6a
[ =C2=A0905.806172] rtw89_8852ce 0000:08:00.0: [ERR]fw PC =3D 0x20150b6a
[ =C2=A0905.806185] rtw89_8852ce 0000:08:00.0: [ERR]fw PC =3D 0x20150b6a
[ =C2=A0905.806198] rtw89_8852ce 0000:08:00.0: [ERR]fw PC =3D 0x20150b6a
[ =C2=A0905.806212] rtw89_8852ce 0000:08:00.0: [ERR]fw PC =3D 0x20150b6a
[ =C2=A0905.806225] rtw89_8852ce 0000:08:00.0: [ERR]fw PC =3D 0x20150b6a
[ =C2=A0905.806239] rtw89_8852ce 0000:08:00.0: [ERR]fw PC =3D 0x20150b6a
[ =C2=A0905.806252] rtw89_8852ce 0000:08:00.0: [ERR]fw PC =3D 0x20150b6a
[ =C2=A0905.806266] rtw89_8852ce 0000:08:00.0: [ERR]fw PC =3D 0x20150b6a
[ =C2=A0905.806279] rtw89_8852ce 0000:08:00.0: [ERR]fw PC =3D 0x20150b6a
[ =C2=A0905.806292] rtw89_8852ce 0000:08:00.0: [ERR]fw PC =3D 0x20150b6a
[ =C2=A0905.806306] rtw89_8852ce 0000:08:00.0: [ERR]fw PC =3D 0x20150b6a
[ =C2=A0905.806319] rtw89_8852ce 0000:08:00.0: [ERR]fw PC =3D 0x20150b6a
[ =C2=A0905.806332] rtw89_8852ce 0000:08:00.0: [ERR]fw PC =3D 0x20150b6a
[ =C2=A0905.806346] rtw89_8852ce 0000:08:00.0: [ERR]fw PC =3D 0x20150b6a
[ =C2=A0905.806358] rtw89_8852ce 0000:08:00.0: SER catches error: 0x4000
[ =C2=A0905.853285] rtw89_8852ce 0000:08:00.0: firmware failed to ack for l=
eaving ps mode
[ =C2=A0905.853288] rtw89_8852ce 0000:08:00.0: SER catches error: 0x4000
[ =C2=A0905.868084] rtw89_8852ce 0000:08:00.0: c2h reg timeout
[ =C2=A0905.918397] rtw89_8852ce 0000:08:00.0: rtw89: failed to leave lps s=
tate
[ =C2=A0905.968190] rtw89_8852ce 0000:08:00.0: firmware failed to ack for l=
eaving ps mode
[ =C2=A0905.968192] rtw89_8852ce 0000:08:00.0: SER catches error: 0x4000
[ =C2=A0905.982965] rtw89_8852ce 0000:08:00.0: c2h reg timeout
[ =C2=A0905.982966] rtw89_8852ce 0000:08:00.0: SER catches error: 0x4000
[ =C2=A0906.033288] rtw89_8852ce 0000:08:00.0: rtw89: failed to leave lps s=
tate
[ =C2=A0906.033290] rtw89_8852ce 0000:08:00.0: SER catches error: 0x4000

Relevant lspci:
08:00.0 Network controller: Realtek Semiconductor Co., Ltd. RTL8852CE PCIe =
802.11ax Wireless Network Controller (rev 01)
Subsystem: AzureWave Device 5600
Flags: bus master, fast devsel, latency 0, IRQ 126, IOMMU group 19
I/O ports at e000 [size=3D256]
Memory at df500000 (64-bit, non-prefetchable) [size=3D1M]
Capabilities: [40] Power Management version 3
Capabilities: [50] MSI: Enable+ Count=3D1/1 Maskable- 64bit+
Capabilities: [70] Express Endpoint, IntMsgNum 0
Capabilities: [100] Advanced Error Reporting
Capabilities: [148] Device Serial Number 00-e0-4c-ff-fe-c8-52-01
Capabilities: [158] Latency Tolerance Reporting
Capabilities: [160] L1 PM Substates
Capabilities: [170] Vendor Specific Information: ID=3D0002 Rev=3D4 Len=3D10=
0 <?>
Kernel driver in use: rtw89_8852ce
Kernel modules: rtw89_8852ce

If there is any other information I can provide, I'd be happy to help.

Thanks,
Jose
