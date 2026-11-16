Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.23
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794847256;
	b=SBBcobdRslrgOs+RDkg/M+6BPlb/PGXZ6hGZAWlXCLGbIVGtWVsV8Pu2XTMC5/oRS5xt
	 ejgLltcJE2ySQB/hcy4q7TGOV74XOuLfVIHfFO8bYjQ2HneGDRB+og0j8zH2rD5HbSKYh
	 OmqTSsK37kq7CdGzkit2t0TQ4OUG39mfsrJAoO0IncA7g7xvUTgbcGmrHdtSnoxpN7XZe
	 wGPHfCCm9Jkto6afSsitGHVVDxDXq29hNe4nlOrHp6V9QX0UrtUo0SFJpV6eaoPLOZRbI
	 BpTxBchF+P7cvmqU8dx77wEWZvM9ymV6J8a+MUYY75OoT4+v7uzZYerG2cPS68UhM+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794847256;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 Feedback-ID:X-Pm-Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=8T2UQ097opql0CaPE8KovI4g8l6BJk5bz0zKvscODXE=;
	b=B15hNJy8LxRfnAW8XmkH2CENrMHXHzW5LHZRh6SlLi6Tc7cqIeeaYn0K91KpwpB1NoFp
	 PNBSipX8WLKL6NhpMuh69wqwJjAjNLmaDX30YFyqH/5Q85U1OVSeK/oPJwVKXqBQe6XVT
	 JqOnMxGWb41hPjqnvdutRbUc+g0TKzmIdM/OU71NA+rDndqf2zKNl6h1qpZE7hYtggTkR
	 4qeeK/DuF8JjGK8odFku9VBVDXh8Zowdvm+Yu7tZkRBwbx8q9JWP3Dme9e7s1PyCs+hk4
	 jPUgHgt+CCWGgbpapIJ/+OcYC9AY7UrkeDmPso0umRkqyC6ZgJb1lmvDyNKqPyxLgUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=empyreal.works;
	spf=pass smtp.mailfrom=empyreal.works;
	dkim=pass header.d=empyreal.works header.i=@empyreal.works header.a=rsa-sha256 header.s=protonmail2 header.b="RuJXcWu/";
	arc=none smtp.remote-ip=185.70.43.23
Received: from mail-4323.protonmail.ch (mail-4323.protonmail.ch [185.70.43.23])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 101F2606A331
	for <linux-wireless@vger.kernel.org>; Mon, 16 Nov 2026 16:40:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 101F2606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=empyreal.works
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=empyreal.works
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=empyreal.works header.i=@empyreal.works header.a=rsa-sha256 header.s=protonmail2 header.b=RuJXcWu/
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=empyreal.works;
	s=protonmail2; t=1794847253; x=1795106453;
	bh=8T2UQ097opql0CaPE8KovI4g8l6BJk5bz0zKvscODXE=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=RuJXcWu/gKgdpT9lViVFs2X9SJVWsO0CFrZnIspEGbJ0jhF3692zF+A3j8K9OrLMO
	 d45S2p+NpGhdiS9cRY/ChcV0ee8GrtAcjNfPe5ce1PbooW3ZWJ1SpcGkuJ1i4JmuZO
	 yGoduaTlPvAN3kW2LcqiVxf8eBzsViptmlRExkE2Ml95bVdGM4/hkiO02wR8o8IIsN
	 tvDZecF1I17vR6EhEWLRKH7IVIa7YoOto17hpaLfJx/ThbsrZt8IyPXDcnAGSFNsPe
	 QxoPahRNsafZ8vcudbsvoLCWRfQLy3O4eAKcNAJ2T3+HU5dK+RTnXi7yR4sIMrAGwW
	 bNEjUK4zpb4aw==
Date: Mon, 16 Nov 2026 16:40:47 +0000
To: Miri Korenblit <miriam.rachel.korenblit@intel.com>
From: Andrei Rusu de Castro <arc@empyreal.works>
Cc: Johannes Berg <johannes@sipsolutions.net>, Emmanuel Grumbach <emmanuel.grumbach@intel.com>, Luca Coelho <luciano.coelho@intel.com>, Kalle Valo <kvalo@kernel.org>, Ayala Beker <ayala.beker@intel.com>, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] wifi: iwlwifi: keep Wi-Fi when Intel AMT powers the host on
Message-ID: <cover.1794846777.git.arc@empyreal.works>
Feedback-ID: 182420409:user:proton
X-Pm-Message-ID: 73c86a630b473a4c67cd4238fa6c0bdc3382c1bf
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

With IWLMEI enabled and AMT's wireless enabled, the host can come up
without Wi-Fi after AMT powers it on: CSME is still handing the NIC back
to the host while iwlwifi probes. On an HP ZBook Firefly 14 G10 (AX211,
CSME 16.1) this happened in two ways:

 - the NIC cannot be woken at probe while CSME still drives it, and the
   probe fails with -110 for good (patch 1);
 - ownership moves back to CSME between the end of the probe and the
   op mode's start, which then fails with -EBUSY (patch 2).

In both cases the SAP connection to CSME is up, so the host can take the
NVM from CSME and request the NIC over SAP, as it does when CSME visibly
owns the NIC at probe.

The series applies to iwlwifi-next. IWLMEI depends on BROKEN; it builds
with CONFIG_WERROR only together with [1], and binds only with [2]:

[1] https://lore.kernel.org/r/20261116-iwlmei-nvm-const-0c16d1de@empyreal.w=
orks
[2] https://lore.kernel.org/r/20261116-mei-cl-dma-parent-60802f47@empyreal.=
works

Tested with both patches on that machine. The failure in patch 1 hit four
of six AMT power-ons and resets before it; with it, AMT power-ons came back
on Wi-Fi 36-48 s after Power on. The race in patch 2 was seen once in seven
AMT power-ons with patch 1 applied (after about 20 minutes off) and did not
recur in the three power-ons since (after 0 s, 2 and 33 minutes off), so it=
s
fallback has not yet run on hardware.

Andrei Rusu de Castro (2):
  wifi: iwlwifi: pcie: use the CSME path when the NIC cannot be woken at
    probe
  wifi: iwlwifi: mvm: take the NVM from CSME when it takes the device
    back

 drivers/net/wireless/intel/iwlwifi/mvm/ops.c  | 13 ++++++
 .../net/wireless/intel/iwlwifi/pcie/trans.c   | 40 ++++++++++++++++++-
 2 files changed, 51 insertions(+), 2 deletions(-)

--=20
2.55.0

