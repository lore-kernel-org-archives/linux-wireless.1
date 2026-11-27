Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.171
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795793507;
	b=XXsYNBeoKbXrs0ALPgoI4LrVWjUUAgeUI5M9qwVhgyBrK2nrk0D40oY5JP052oUrUeBC
	 F8ESlc/3Osxqu//tPYHgMsNvyD2dqG877Ed1bGGdXoYjYHwn7tmtqopmftpATt4DrzWG/
	 CRx3lN3v55wfKIcUrjxpw0AYhLz1VREb2qoVzYdBVzy74NvFIBwasXkFvrVgGm2wvKrbx
	 8QsQUb/VZAsAo7LELC9Dk/GPwb55XNScywLocT8VbGn/KTNs3reVKahjGV8DEAxwr19M/
	 TtGWRSIq9RhiIi5UUzZU6aUaUCVG/ASr81xE5twsMpx8boHyZ+lTWWTuaylOE7pamvw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795793507;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=B0qbJ8g2Vdj9HAdNnwCKwtoZV+3naWX33A2WnJvViLI=;
	b=bQG++umqhBcMvkRi8D7Njj89J03BozUNvOToWAc/a0rhnK3q7feFKne2vTu2Y4B3zyIu
	 RPNja6Fy4Yn0fbaumLp7irEeFksd0gcnFl6xSvIC/uCHtPdWNdp8gP7OfGlSxOYilbDaT
	 iPtkCw4IEa/hSKU71Ti1F+w7owUm/JV+ebkS98O1fl7yDmUpnnQGzIgCr+HcH/rpfxR26
	 VpFTgpurpDkb3YrNttxWSyL6C81QLo1CxUd0C7+tGDQ1mEx9lgvXo3OGnTCnuys/a/KO6
	 bV/XD4dn9z/AZob1eKU375X5AjTUm60m3PMW+rK91xaEbS34UxeiFbPpL+KjQtnM2dw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oFGyoydc;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.171
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63FAD606A31E
	for <linux-wireless@vger.kernel.org>; Fri, 27 Nov 2026 15:31:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63FAD606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oFGyoydc
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-8b4e246acc2so58867287b3.3
        for <linux-wireless@vger.kernel.org>; Fri, 27 Nov 2026 07:31:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795793505; cv=none;
        d=google.com; s=arc-20260327;
        b=a9UtzHkdjscJJaf1T2GH60O10RPB/mVkP+aSSGgMqS5sHSw1V+AW8T1v1hIWQJm07+
         D6lUGN42INdfxTvIOLsK8LaoKInTdlGwHL8iHw/zXOA9Ik4GsjJNoyCzuaFlKZjnVzW7
         1HyNmrIfvpPotsapJaBSvCC5RHNSrNqq4YFrdVqRBIHCwayR413OQLA1EMVsy/7QdS8N
         jd7HbhCuusyvV/1Lm9RbMPXdi6BUFZR2UJZJuKxibOj+PSYghneGa2eJ+BdjtvnOpigJ
         wtt3bv5GQsnEq2L1MACFW4Xuq1q7/G7r0YkduLxv3Gk4HIraOoxB1YwKKkiZ13GKTYX3
         1SPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=B0qbJ8g2Vdj9HAdNnwCKwtoZV+3naWX33A2WnJvViLI=;
        fh=A6Vivuh0th99pI8xmBv/sfZnnCXEKvaXEbIDLQ4Rrjo=;
        b=oqKIFMQdC2W9NE+YjJrqZbkPSe5WhWsXz0VmNbM7RoSqA8dzVzHOA4vGBw4HDluz+L
         XOU1dEhlzcrVT993IwURVQyDOjr+uZBryEaiP7JZX3tHurz9lu5ARYYoAeteeEqg8a9X
         zwdvyIis+rmPUR+2hYbe0oPdiVDbbMzvHKvK/eDpvkIj4vGt14y+Ye+DseacvAp+RQBw
         3zeUdr9l5qQBSJ/gCQzUCfKDzd+3AC2/xknrN8Y9Jxm90RxmXNq0DN4iejWNjn8RlG8v
         My5X9Vv8u+LJWTv0gJqvQccm6yfNsQa/xCwIl4slI5QHg1C0vO1ofuuWAzz2vMnRIpbG
         QbgQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795793505; x=1796398305; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=B0qbJ8g2Vdj9HAdNnwCKwtoZV+3naWX33A2WnJvViLI=;
        b=oFGyoydcTM4xxsBrg6DiGiIo/VittTX4SQ3DgnEjqp962VrX52Af7bN3dxXmqy0jmo
         4WWxEtA4mGeC/7vjRjq/Wj/3gJQjQsHenVtIKEur09QtcXJ7dbVTKa+IbXXvU1UZ2zNO
         ZqFEUGoTHEbnEf/ZxvOKrUg9P4yExiFve8m9i+r7eIbbGpJ+dgZlzQ+m8UNA7qqDbCPK
         Cgp7b1RSr6A4ocIf1aT9rAmGYBn3+GEmzJZXyvqHDSHj9Fjzxb7GGnyBkp+qVSBSzXaj
         QWFyQTn6Ug4rMnQL35I53jRkJt/2/HxSkmRiR4WCklrtHwvwD71f3oIY4aYY6mdv2aG2
         1MuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795793505; x=1796398305;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=B0qbJ8g2Vdj9HAdNnwCKwtoZV+3naWX33A2WnJvViLI=;
        b=mndzv31AEQu+k300OwZ7CWdwn/hrws7T+dWLswpFqz69kxc8oRK0dzjNXyD+MNhnXQ
         2WPsu2dpbRPPKm3thU1PLSJl6WNaGBT9G4yJxclBm5+qEDH7lywSnK+mwE8af+D3g7yJ
         C1IloEKdbwkXmpctwowAy9NDFaywASlNQd/6P1Url0KNbSRYBXdT8TXfPeVuYAt+N+iA
         rTFuajV6OJnXOB5JPVCzuqnDNif0y4PbOI0ntZ3h6SHvI2dV9GbSzo0XFRHDEhY1+1O0
         KMpkwFu6OS7ZDAZfph84mQlJueCgX5NV7PGLOjfM3A0mXdXIl5T423DByKGagjo7Nbbu
         +vAA==
X-Gm-Message-State: APuU4Z+wjmT/ntTNKljk/c/Obc86+Exh7Vkb8HrHRa/ypdTgYXC5PbVv
	d6amcyeVW3e9K/cbfehFyT65Nbok63dZ4eW7Ix75qtprbU6Orgf3mwddHpSggdvpQ0p+9h22RZi
	cQUNjOZwfBoqICcpSVdSGy/9OO4SP94U=
X-Gm-Gg: AZFdTZfGzyV8+r3nibo/NSHzWRRl1AerisF/pNwqDmU1cfhUiNWf0Dq/VVbp1hUhWNu
	h09vUogvHsWleFROKcOCSrekFxF+2sTp2Plp3ZUSCaQlyu7GLwZTSuu5MbyVxnlD0+3echHqu5p
	LIMAiBbguvkIZ5A+UWClu4eKSuZjLH+3s8Mz+JbkTPf5h0qohr9GmD5v3RZysnvulOjz8WVnmM5
	gdze6yM10zPqT85RzMWSrTs3Z4A1HHxxzaYBWqocAY8dqFwUSsRdAES2ZgrhQd90aX/zdVjpw0n
	n+G2tiuTIrLVXVScLEY2Y/nAvcpoJKuCIqmoRdFAAFXHypRqhlCDc4FhMo2Ez6DVMskuEOo3UFg
	CkNn+WsdUIy37b0/eTbGp3tNl62xdfU6hUN3XWA92ZAnrDKudZ4LQq1nQEC0xErkTzEUQC+UgiV
	c50k1lvX8WwURupU3gJ/8hGRBIu5fZiqB77cFJpN0F
X-Received: by 2002:a05:690c:6982:b0:8b3:bb2f:4101 with SMTP id
 00721157ae682-8b5204aa181mr108453437b3.34.1795793505179; Fri, 27 Nov 2026
 07:31:45 -0800 (PST)
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Collin Rose <collinr@gmail.com>
Date: Fri, 27 Nov 2026 10:31:34 -0500
X-Gm-Features: Aa3M54p9EKYq_L9WbiXSSrQ1XaZaTTZu0S9JTeSvbioCYnR5ZVi5HGZBdKcjSO4
Message-ID: <CA+d3OrdhgXy8Dhfi_V=9sEqU=FK4tDzt4HVgOz9Uqw7OTP+8Jg@mail.gmail.com>
Subject: [PATCH wireless] wifi: brcmfmac: use legacy MBSS when
 interface_create is unsupported
To: arend.vanspriel@broadcom.com
Cc: linux-wireless@vger.kernel.org, brcm80211@lists.linux.dev, 
	brcm80211-dev-list.pdl@broadcom.com
Content-Type: text/plain; charset="UTF-8"

Firmware that predates the interface_create iovar, for example BCM43602
firmware 7.35.177.56 found on bcm53xx routers, cannot answer the version
query that brcmf_cfg80211_request_ap_if() sends after interface_create
v1 and v2 have failed:

  brcmfmac: failed to create interface(v1), err=-52
  brcmfmac: failed to create interface(v2), err=-52
  brcmfmac: fail to get supported version, err=-52

The function then returns -EOPNOTSUPP and never reaches the bsscfg:ssid
code a few lines below, which is how this firmware creates an additional
AP BSS. Before commit 1562bdef9251 that was the only method used, so
adding a second AP worked. Now the add_virtual_intf call fails with -95,
and because hostapd configures every BSS of a radio together, it
disables the whole radio, including the primary AP. A guest or second
SSID therefore takes the primary network down.

Treat a failed version query like an unsupported version. Set the
version to 0 so the switch default reports interface_create as
unsupported, which is what already selects the bsscfg:ssid path.
Firmware that answers the query takes the same code path as before.

Tested on a SmartRG SR400ac (two BCM43602/1 PCIe radios, firmware
7.35.177.56) running OpenWrt 25.12.6, which builds this driver from
backports 6.18.55 on a 6.12.112 kernel. Without the change the second
AP fails as above and both radios are disabled. With it, the driver
logs the unsupported version, creates the BSS through bsscfg:ssid, and
a primary and a second AP stay up together on 2.4 GHz and on 5 GHz.

Fixes: 1562bdef9251 ("brcmfmac: Fix AP interface delete issue")
Cc: stable@vger.kernel.org
Signed-off-by: Collin Rose <collinr@gmail.com>
---
Notes for reviewers, not for the commit message:

* brcmf_cfg80211_request_sta_if() has the same early return, but it has
  no legacy fallback to reach, so I left it alone.

* The run above was with the backports copy of the driver on a 6.12
  kernel, not a mainline build. The changed hunk is identical to the
  current wireless tree. I have not tested other firmware or chips.

* A change of this shape was first published for a Netgear R8000, which
  has the same chip and firmware, in patches/861 of
  https://github.com/88plug/netgear-r8000-plus (GPL-2.0). This is an
  independent port to the current tree and a re-test on different
  hardware.

* The downstream OpenWrt pull request carrying the same change is
  https://github.com/openwrt/openwrt/pull/26697

* If you would rather not print "not support interface create(v0)" at
  error level for old firmware, I can send a follow-up.

 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c
b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c
index 46714d871..87aabb7cd 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c
@@ -760,7 +760,8 @@ static int brcmf_cfg80211_request_ap_if(struct
brcmf_if *ifp)
  &iface_create_ver);
  if (err) {
  brcmf_err("fail to get supported version, err=%d\n", err);
- return -EOPNOTSUPP;
+ /* Old firmware: use the legacy bsscfg:ssid path below. */
+ iface_create_ver = 0;
  }

  switch (iface_create_ver) {
-- 
2.48.1
