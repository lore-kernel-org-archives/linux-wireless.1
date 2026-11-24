Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795480539;
	b=TtmICLpiIx0QMfjsI/bc6yFlcCkeVA9PjcwDKJOSxZNvEO7vBc1//hQmZeRBk+o5FDnt
	 Q82JD8z4eRRANMp4oxabdBBAI/MRJq3Cplmz2+OdIyEeaMu1zwsZYvupCOlE5fgI+CmDb
	 2WbVCGE8ycG3XQB3Nm6eKGBjPLl1qd0RceyhqdL4ke1JM+w4PCqRg5+clz+yFFt4Gh5rg
	 67ErMg9xx8IEah7iioT1UFi0KdgaEhfdfNl5zymZWDsBP3QNTUDLCi/Lrf+pGQdQNDlss
	 yDCHzvYPnM7CdfqegZs9CF2kwtw4BljsdNLOZNkkKef8CW2uEiA2YzlaX/CdyL1IaTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795480539;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=cEtlzbFffNbXEfnRfrfQt3jwhoK6waIbjHPV7EqbNas=;
	b=VPTLY+i5EoWD4qcYejs/DNqWhKhZfrszq9P7IyX4sxjZwh7hZGYUtpIWk9phfwfASRza
	 R+f17pYcw9fjoH1R71M0PxHXd4KPa4F30b/vuPAmoVvEny+pjEv3d2OYu0VhyxAwr0ln6
	 6xSKDbn3yEKmXZcHM1EfkbjhBajTpZna7aGUXAytVRdTVoEyiCfR4OjSJqHaU1FoA25Jx
	 araIflnoHrypKsPZfYDrPEuNa5WgKLSkESFg2inqICk4eHM2Fpf3ivVma4BjCWhPQ8uzQ
	 hCXZRjkHkUykM/5xlCKv5p2xDtkZVGIpyUZWT//+1iGoZYDNXXutRftiAM0ESEYce9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=iiitd.ac.in;
	spf=pass smtp.mailfrom=iiitd.ac.in;
	dkim=pass header.d=iiitd.ac.in header.i=@iiitd.ac.in header.a=rsa-sha256 header.s=google header.b=ANJWtQn0;
	arc=none smtp.remote-ip=209.85.210.173
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09194606A336
	for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 00:35:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 09194606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iiitd.ac.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iiitd.ac.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iiitd.ac.in header.i=@iiitd.ac.in header.a=rsa-sha256 header.s=google header.b=ANJWtQn0
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-8b5a6f2f27fso1565966b3a.3
        for <linux-wireless@vger.kernel.org>; Mon, 23 Nov 2026 16:35:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=iiitd.ac.in; s=google; t=1795480538; x=1796085338; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cEtlzbFffNbXEfnRfrfQt3jwhoK6waIbjHPV7EqbNas=;
        b=ANJWtQn07idnhIuzVfW3nPlfg6xJ5aMg8KP5bLevx3ryF2EWMf5Y2C2WnH6ulnyDwL
         eyV0Rx92s0RCZMZDUL2ElO3Uo4+YC/BngcH6FawYWA+xrCOfKO9bKLQ9mOYbWuLJdHpf
         HRKvwqw581M4r2LNr72lq0FbnDg2OG/qqKnD0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795480538; x=1796085338;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cEtlzbFffNbXEfnRfrfQt3jwhoK6waIbjHPV7EqbNas=;
        b=iHitG4G7rJquJn9Jch181D/owpCcsdB1sryazFLTGhq9vjArpUStOwp4CdZGHsmNyv
         7cKcQ46o9KKIh1/FlEs0bsCOA2dNr4q1fBkVb1zK48+VpU6cM7FQ/6DrVkMWjQiorwjb
         PwdleZTWeclrw3iGazfArgaBvb9Z8c86qgn4j/JV9XBRbFDzSxJ879dYn/HGU6p9ffp7
         N5DqY0xXquzcTXnj18+I6ChqxN4qHpZsvhfkLUZyw/LDK3IQt8SnvNbWs+FBXceLsxYQ
         DBtLSoZWkmO9D4366rzA3tWlgMywNnMw0Z1WBQXO9RzgxsQAzc+LzTB76Dseng4e/BTT
         hBZg==
X-Forwarded-Encrypted: i=1; AL+hErFWClIiApZKyAwVEQXSk2KmWZNXggOGRx6yu6ANu+uZMZCLAQPjmmvIQaIkBCQYXzPD9mSx1yOq9Y59Khahow==@vger.kernel.org
X-Gm-Message-State: APuU4Z/Gb04zYc1EBPGJ7Vo8XU+imv/0rz90RzoqrgTdyj8uzM6yQ/at
	GVl0yUgl8nWc0SYfP29riqXUmnX3iBfLtStOjp1pYqfNKYk6/HcnuAukQpwTgs9cV4g=
X-Gm-Gg: AZFdTZfmGa8hZTvHgkjcQYkjErxuiXaxthP4PfEhgMB5hiJNp+a0LXYHyUdZ6YNKjD/
	2+nk8S0H5peHYIK2TMbowx23IY3rCUz2G0Q7R40hQrupyRTgw0BwFXwZuiSX8d6NUaKDQCckkoO
	Kvhqv2X/BN3c+RBT2r8OdrHK4YXrVvmg57ZlJrh3bvB0RUgURKYXcf+/u7DYRRBKYI6zSX84dlS
	hY31tnfP0Yvzw16u0DTCH88qTERaBz9L8bnZKv+DZfjBBV0pVcbBbdQz5QdgXEOM58nJxKxi8wM
	T7euJITE53jBRWCbxdeMjRz2uPTuXlJmA6O1iDOy233mEf7nH2xm4HGdpF6vnxj/NTX/NbAwFC5
	bCTMAo+sINWml3AwZpesrzIZJG06DGj6Q468xlVfllN4qL/BUYKXjlNaznZ4XhSRHjLCeDTmPxQ
	rLzDc/0rfYnDTa4E7Ck1u7KpiBqx0SpmeYKd5YtCZDaLCHRjuwGmIxM9/c1mJ6/kOwP90WlVULt
	2ssFN9e/xwVjDp/4FP2W87KFQRkyVhpgChKdQCQO5jqa5iqZbG68i5gagJ8C4/EzZ99KlCDKMRS
	XXo07IZWjDhFdWz+PeILAE4wvta4Cu0aicRtY+QKXYYCAzquJYfBjUF2fm/ia21zSb3ZC332Wvm
	KT7GdYIs5eUSqMRYO0YvHpZ2LApeSsIWobP1rxqsJ9tmJt3wAoKSZw6MIO/UHS6/X
X-Received: by 2002:a05:6a21:9188:b0:3eb:abb7:f92c with SMTP id adf61e73a8af0-4014cb3eed2mr11300988637.22.1795480538338;
        Mon, 23 Nov 2026 16:35:38 -0800 (PST)
Received: from iiitd-S2600STB.iiitd.edu.in ([103.25.231.160])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6cfc8829sm6076667a12.8.2026.11.23.16.35.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 16:35:37 -0800 (PST)
From: Piyus Kedia <piyus@iiitd.ac.in>
To: Johannes Berg <johannes@sipsolutions.net>,
	linux-wireless@vger.kernel.org
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kapil Vaswani <kapil@presceralabs.ai>,
	Piyus Kedia <piyus@iiitd.ac.in>,
	stable@vger.kernel.org
Subject: [PATCH wireless 1/2] wifi: mac80211: do not copy the mesh RSN IE twice into the beacon
Date: Tue, 24 Nov 2026 06:05:25 +0530
Message-Id: <20261124003526.78471-2-piyus@iiitd.ac.in>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261124003526.78471-1-piyus@iiitd.ac.in>
References: <20261124003526.78471-1-piyus@iiitd.ac.in>
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

ieee80211_mesh_build_beacon() budgets the user's extra IE blob once:

	tail_len = ... +
		   ifmsh->ie_len;

	bcn = kzalloc(sizeof(*bcn) + head_len + tail_len, GFP_KERNEL);

but two of the builders that fill the tail draw from that blob.
mesh_add_vendor_ies() emits everything from the first vendor IE to the
end of it:

	offset = ieee80211_ie_split_vendor(ifmsh->ie, ifmsh->ie_len, 0);

	if (offset < ifmsh->ie_len) {
		len = ifmsh->ie_len - offset;
		data = ifmsh->ie + offset;
		...
		skb_put_data(skb, data, len);

while mesh_add_rsn_ie() searches the whole blob:

	data = cfg80211_find_ie(WLAN_EID_RSN, ifmsh->ie, ifmsh->ie_len);

A blob that begins with a vendor IE therefore has its RSN IE emitted
twice - once inside the verbatim vendor range, once on its own - and the
tail copy runs past the allocation:

  BUG: KASAN: slab-out-of-bounds in ieee80211_mesh_build_beacon+0xe3f
  Write of size 479 at addr ffff88805ca1887b by task syz-executor
   __asan_memcpy
   ieee80211_mesh_build_beacon          net/mac80211/mesh.c:1110
   ieee80211_start_mesh                 net/mac80211/mesh.c:1187
   ieee80211_join_mesh                  net/mac80211/cfg.c:3330
   rdev_join_mesh
   __cfg80211_join_mesh                 net/wireless/mesh.c:214
   nl80211_join_mesh                    net/wireless/nl80211.c:15399

One NL80211_CMD_JOIN_MESH carrying such an NL80211_ATTR_IE is enough.

Confine the RSN search to the non-vendor part of the blob, so the two
builders cover disjoint ranges and their total cannot exceed the single
ifmsh->ie_len the beacon was sized with.  The blob reaches us having passed
validate_ie_attr(), which walks the element chain and requires it to end
exactly at the end of the attribute, so the split returns an element
boundary that is not past ifmsh->ie_len.

An RSN IE placed behind a vendor IE is still emitted, as part of that
verbatim vendor range; nothing that a well-formed configuration sends is
dropped.

How this was found: by AI-driven fuzzing built on top of syzkaller.  Its
analysis was checked by hand against the code, the fault was reproduced on
net.git main under KASAN, and the patched kernel is clean on the same
reproducer with ordinary secure-mesh beacons unaffected.

Fixes: 2b5e19677592 ("mac80211: cache mesh beacon")
Cc: stable@vger.kernel.org
Signed-off-by: Kapil Vaswani <kapil@presceralabs.ai>
Signed-off-by: Piyus Kedia <piyus@iiitd.ac.in>
---
 net/mac80211/mesh.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/net/mac80211/mesh.c b/net/mac80211/mesh.c
index 8f8814125375..eb54bd98f282 100644
--- a/net/mac80211/mesh.c
+++ b/net/mac80211/mesh.c
@@ -379,12 +379,19 @@ int mesh_add_rsn_ie(struct ieee80211_sub_if_data *sdata, struct sk_buff *skb)
 	struct ieee80211_if_mesh *ifmsh = &sdata->u.mesh;
 	u8 len = 0;
 	const u8 *data;
+	size_t prefix;
 
 	if (!ifmsh->ie || !ifmsh->ie_len)
 		return 0;
 
-	/* find RSN IE */
-	data = cfg80211_find_ie(WLAN_EID_RSN, ifmsh->ie, ifmsh->ie_len);
+	/* Find the RSN IE in the non-vendor part of the blob only.  Everything
+	 * from the first vendor IE onwards is emitted verbatim by
+	 * mesh_add_vendor_ies(), and ieee80211_mesh_build_beacon() budgets
+	 * ifmsh->ie_len once for both of them, so an RSN IE sitting behind a
+	 * vendor IE would be copied twice and overrun the beacon's tail.
+	 */
+	prefix = ieee80211_ie_split_vendor(ifmsh->ie, ifmsh->ie_len, 0);
+	data = cfg80211_find_ie(WLAN_EID_RSN, ifmsh->ie, prefix);
 	if (!data)
 		return 0;
 
-- 
2.34.1

